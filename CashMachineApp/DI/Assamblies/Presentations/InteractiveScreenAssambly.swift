//
//  InteractiveScreenAssambly.swift
//  VIPER CashmachineIB
//
//  Created by Serg on 20/10/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import Foundation
import UIKit
import Swinject

class InteractiveScreenAssambly: Assembly {
    func assemble(container: Container) {
        container.register(ViewInputInteractiveScreen.self) { _ in UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "InteractiveScreen") as! InteractiveScreen }
            .initCompleted { (r, i) in
                let vC = i as! InteractiveScreen
                vC.output = r.resolve(ViewOutputInteractiveScreen.self)!
        }
        
        container.register(ViewOutputInteractiveScreen.self) { r in PresenterInteractiveScreen(interactor: r.resolve(InteractorInputInteractiveScreen.self)!, router: r.resolve(RoutingInput.self)!, viewInput: r.resolve(ViewInputInteractiveScreen.self)!, mapper: r.resolve(IMapperInteractiveScreen.self)!) }.implements(InteractorOutputInteractiveScreen.self)
        
        container.register(RoutingInput.self) { _ in CoordinatorRouting() }
        .inObjectScope(.container)
        
        container.register(InteractorInputInteractiveScreen.self) { _ in InteractorInteractiveScreen() }
            .implements(MakeBill.self)
            .initCompleted { r, i in
                let interactor = i as! InteractorInteractiveScreen
                interactor.output = r.resolve(InteractorOutputInteractiveScreen.self)
                interactor.countService = r.resolve(CashMachine.self)
        }
        
        container.register(IMapperInteractiveScreen.self) { _ in
            MapperInteractiveScreen()
        }
        
    }
    
}

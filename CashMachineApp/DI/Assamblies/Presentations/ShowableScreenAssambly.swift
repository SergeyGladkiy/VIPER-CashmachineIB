//
//  ShowableScreenAssambly.swift
//  VIPER CashmachineIB
//
//  Created by Serg on 20/10/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import Foundation
import UIKit
import Swinject

class ShowableScreenAssambly: Assembly {
    func assemble(container: Container) {
        container.register(ViewInputShowableScreen.self) { _ in
            UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ShowableScreen") as! ShowableScreen }
            .initCompleted { (r, vC) in
                let viewController = vC as! ShowableScreen
                viewController.output = r.resolve(ViewOutputShowableScreen.self)!
        }
        
        container.register(ViewOutputShowableScreen.self) { r in
            PresenterShowableScreen(view: r.resolve(ViewInputShowableScreen.self)!, interactor: r.resolve(InteractorInputShowableScreen.self)!, router: r.resolve(RoutingInput.self)!)
        }.implements(InteractorOutputShowableScreen.self)
        
        container.register(InteractorInputShowableScreen.self) { _ in
            InteractorShowableScreen()
            }.initCompleted { (r, i) in
                let interactor = i as! InteractorShowableScreen
                interactor.output = r.resolve(InteractorOutputShowableScreen.self)
                interactor.entity = r.resolve(EntityShowableScreen.self)
        }
        
        container.register(EntityShowableScreen.self) { _ in
            EntityShowableScreen()
        }.inObjectScope(.container)
    }
}

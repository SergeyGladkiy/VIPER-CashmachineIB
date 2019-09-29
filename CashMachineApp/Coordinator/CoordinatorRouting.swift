//
//  CoordinatorRouting.swift
//  VIPER CashmachineIB
//
//  Created by Serg on 28/09/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import Foundation
import UIKit

class CoordinatorRouting {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
}

extension CoordinatorRouting {
    
    //MARK: Build a sreen to display purchases - VisisblePurchasesScreen
    private func buildVisiblePurchaseScreen() -> UIViewController {
        
    }
    
}

extension CoordinatorRouting: RoutingInput {
    
    //MARK: Build a main view controller - InteractiveScreen
    func start() -> UIViewController {
        let interactor = InteractorInteractiveScreen()
        let vc = storyboard.instantiateViewController(withIdentifier: "InteractiveScreen") as! InteractiveScreen
        let presenter = PresenterInteractiveScreen(interactor: interactor, router: self, viewInput: vc)
        let cashMachine = CashMachineAssembly.build(device: interactor , credentials: "Tanaeva Kristina Aleksandrovna")
        vc.output = presenter
        interactor.output = presenter
        interactor.entity = cashMachine
        return vc
    }
    
    func showShoppingItems(_ arrayGoods: [GoodsTableViewCellViewModel]) {
        
    }
    
    func back() {
        
    }
    
    
}

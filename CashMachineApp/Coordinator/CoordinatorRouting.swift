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
    private var interactiveScreen: ViewInputInteractiveScreen!
    private var countService: CashMachine!
    
    private var showableScreen: ViewInputShowableScreen!
    private var entityShowableScreen: EntityShowableScreen!
}

extension CoordinatorRouting {
    
    //MARK: Build a sreen to display purchases - VisisblePurchasesScreen
//    private func buildModuleShowableScreen() -> UIViewController {
//        self.showableScreen = DependenceProvider.resolve()
//        return showableScreen
//    }
    
}

extension CoordinatorRouting: RoutingInput {
    
    //MARK: Build a main view controller - InteractiveScreen
    func start() -> UIViewController {
        self.interactiveScreen = DependenceProvider.resolve()
        return interactiveScreen
    }
    
    //MARK: Transition to ShowableScreen from InteractiveScreen
    func dataForDisplay(_ array: [InformationCellViewModel]) {
        self.entityShowableScreen = DependenceProvider.resolve()
        self.entityShowableScreen.arrayItems = array
        self.countService = DependenceProvider.resolve()
        self.showableScreen = DependenceProvider.resolve()
        self.entityShowableScreen.onDeleted = { index in
            self.countService.removeScannedItem(index: index)
        }
        self.interactiveScreen.present(self.showableScreen, animated: true, completion: nil)
    }
    
    //MARK: Dismiss VCShowableScreen, transition to InteractiveScreen
    func back() {
        self.showableScreen.dismiss(animated: true, completion: nil)
    }
}

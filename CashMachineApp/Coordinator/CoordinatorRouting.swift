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
    private var interactiveScreen: InteractiveScreen!
    private var countService: CashMachine!
    
    private var showableScreen: ShowableScreen!
    private var interactorShowableScreen: InteractorShowableScreen!
    private var entityShowableScreen: EntityShowableScreen!
}

extension CoordinatorRouting {
    
    //MARK: Build a sreen to display purchases - VisisblePurchasesScreen
    private func buildModuleShowableScreen() -> UIViewController {
        self.entityShowableScreen = EntityShowableScreen()
        self.interactorShowableScreen = InteractorShowableScreen()
        self.interactorShowableScreen.entity = self.entityShowableScreen
        let view = storyboard.instantiateViewController(withIdentifier: "ShowableScreen") as! ShowableScreen
        //let view = ShowableScreen(nibName: nil, bundle: nil)
        let presenter = PresenterShowableScreen(view: view,
                                                interactor: self.interactorShowableScreen,
                                                router: self)
        view.output = presenter
        self.interactorShowableScreen.output = presenter
        return view
    }
    
}

extension CoordinatorRouting: RoutingInput {
    
    //MARK: Build a main view controller - InteractiveScreen
    func start() -> UIViewController {
        let interactor = InteractorInteractiveScreen()
        let vc = storyboard.instantiateViewController(withIdentifier: "InteractiveScreen") as! InteractiveScreen
        self.interactiveScreen = vc
        let mapper = MapperInteractiveScreen()
        let presenter = PresenterInteractiveScreen(interactor: interactor, router: self, viewInput: vc, mapper: mapper)
        self.countService = CashMachineAssembly.build(device: interactor, credentials: "Tanaeva Kristina Aleksandrovna")
        vc.output = presenter
        interactor.output = presenter
        interactor.countService = self.countService
        return vc
    }
    
    //MARK: Transition to ShowableScreen from InteractiveScreen
    func dataForDisplay(_ array: [InformationCellViewModel]) {
        self.showableScreen = buildModuleShowableScreen() as? ShowableScreen
        self.entityShowableScreen.arrayItems = array
        self.interactorShowableScreen.prepareShowableItems()
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

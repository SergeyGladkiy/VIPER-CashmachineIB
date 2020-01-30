//
//  PresenterVisiblePurchasesScreen.swift
//  VIPER CashmachineIB
//
//  Created by Serg on 28/09/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import Foundation

class PresenterShowableScreen {
    private unowned let view: ViewInputShowableScreen
    private var interactor: InteractorInputShowableScreen
    private unowned let router: RoutingInput
    
    init(view: ViewInputShowableScreen, interactor: InteractorInputShowableScreen, router: RoutingInput) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension PresenterShowableScreen: ViewOutputShowableScreen {
    func loadData() {
        interactor.prepareShowableItems()
    }
    
    func deleteButtonPressed(item: Int) {
        interactor.remove(at: item)
    }
    
    func backToInteractive() {
        router.back()
    }
}

extension PresenterShowableScreen: InteractorOutputShowableScreen {
    func readyItems(_ array: [InformationCellViewModel]) {
        view.setDataOfItems(array)
    }
    
    func deletedItem(_ number: Int) {
        view.deleteIndexPath(row: number)
    }
}

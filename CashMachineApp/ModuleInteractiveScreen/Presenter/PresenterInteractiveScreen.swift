//
//  Presenter.swift
//  Viper
//
//  Created by Serg on 13/04/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import Foundation

class PresenterInteractiveScreen {
    
    private unowned let viewInput: ViewInputInteractiveScreen
    private var interactor: InteractorInputInteractiveScreen
    private unowned let router: RoutingInput
    private var mapper: IMapperInteractiveScreen
    
    private var maintainedPr: ((String)-> Void)!
    
    init(interactor: InteractorInputInteractiveScreen, router: RoutingInput, viewInput: ViewInputInteractiveScreen, mapper: IMapperInteractiveScreen) {
        self.interactor = interactor
        self.router = router
        self.viewInput = viewInput
        self.mapper = mapper
        allMaintainedAction()
    }
}

extension PresenterInteractiveScreen: ViewOutputInteractiveScreen {
        
    func allMaintainedAction() {
        self.viewInput.maintainedRegister = { 
            self.interactor.registerItem(name: $0, code: $1, priceCurrency: $2, priceValue: $3, tax: $4)
        }
        self.readyData = { [unowned self] in
            self.viewInput.displayBill(data: $0)
        }
    }
    
    func scanButtonTapped(code: String, quantity: Double) {
        interactor.scanItem(code: code, quantity: quantity)
    }
    
    func payButtonTapped() {
        interactor.pay()
    }
    
    func transitionButtonTapped() {
        interactor.dataOfItems()
    }
}

extension PresenterInteractiveScreen: InteractorOutputInteractiveScreen {
    
    var readyData: (String) -> Void {
        get {
            return maintainedPr
        }
        set {
            maintainedPr = newValue
        }
    }

    func occurError(_ errorMessage: String) {
        viewInput.displayError(errorMessage)
    }
    
    func readyInformationOnItems(_ array: [InformationItem]) {
        let items = mapper.prepareItemsForRouting(array)
        router.dataForDisplay(items)
    }
    
    func occurSuccessfulAction(_ message: String) {
        viewInput.displaySuccessfulAction(message)
    }
    
}

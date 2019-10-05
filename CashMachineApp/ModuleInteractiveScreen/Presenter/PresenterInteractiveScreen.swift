//
//  Presenter.swift
//  Viper
//
//  Created by Serg on 13/04/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import Foundation

class PresenterInteractiveScreen {
    
    private weak var viewInput: ViewInputInteractiveScreen!
    private var interactor: InteractorInputInteractiveScreen
    private var router: RoutingInput
    private var mapper: IMapperInteractiveScreen
    
    init(interactor: InteractorInputInteractiveScreen, router: RoutingInput, viewInput: ViewInputInteractiveScreen, mapper: IMapperInteractiveScreen) {
        self.interactor = interactor
        self.router = router
        self.viewInput = viewInput
        self.mapper = mapper
    }
}

extension PresenterInteractiveScreen: ViewOutputInteractiveScreen {
    
    
    func registerButtonTapped(name: String, code: String, priceCurrency: String, priceValue: Double, tax: TaxMode) {
        interactor.registerItem(name: name, code: code, priceCurrency: priceCurrency, priceValue: priceValue, tax: tax)
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
    
    func readyBill(data: String) {
        viewInput.displayBill(data: data)
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

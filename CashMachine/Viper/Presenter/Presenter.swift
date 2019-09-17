//
//  Presenter.swift
//  Viper
//
//  Created by Serg on 13/04/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import Foundation

class Presenter {
    
    private weak var viewInput: ViewInput!
    private var interactor: InteractorInput
    private var router: IRouterInput
    
    init(interactor: InteractorInput, router: IRouterInput, viewInput: ViewInput) {
        self.interactor = interactor
        self.router = router
        self.viewInput = viewInput
    }
}

extension Presenter: ViewOutput {
    func registerButtonTapped(name: String, code: String, priceCurrency: String, priceValue: Double, tax: TaxMode) {
        interactor.registerItem(name: name, code: code, priceCurrency: priceCurrency, priceValue: priceValue, tax: tax)
    }
    
    func scanButtonTapped(code: String, quantity: Double) {
        interactor.scanItem(code: code, quantity: quantity)
    }
    
    func payButtonTapped(name: [String]) {
        interactor.pay(name: name)
    }
}

extension Presenter: InteractorOutput {
    
    func readyPrintBill(data: String) {
        viewInput.displayBill(data: data)
    }
    
    func occurError(_ errorMessage: String) {
        viewInput.displayError(errorMessage)
    }
    
    func itemsForTableView(array: [GoodsTableViewCellViewModel]) {
        viewInput.demonstrationItemsforTableView(array: array)
    }
}

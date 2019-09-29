//
//  Interactor.swift
//  Viper
//
//  Created by Serg on 13/04/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import Foundation

class InteractorInteractiveScreen {
    
    var output: InteractorOutputInteractiveScreen!
    var entity: CashMachine!

}

extension InteractorInteractiveScreen: InteractorInputInteractiveScreen {
    
    func registerItem(name: String, code: String, priceCurrency: String, priceValue: Double, tax: TaxMode) {
        entity.register(item: RegisterableItem(name: name, code: code, price: Price(currencyUnit: priceCurrency, value: priceValue), tax: tax))
        
    }
    
    func scanItem(code: String, quantity: Double) {
        do {
            try entity.scan(item: ScannableItem(code: code, quantity: quantity))
        } catch let error as CashmashineErrors {
            forError(error.localizedDescription)
            return
        } catch {
            forError("Error")
        }
        let tableViewArray = entity.makeForTableView()
        forTableView(array: tableViewArray)
        
    }
    
    func pay(name: [String]) {
        entity.pay(name: name)
        let tableViewArray = entity.makeForTableView()
        forTableView(array: tableViewArray)
    }
    
    func forError(_ errorMessage: String) { 
        output.occurError(errorMessage)
    }
    
    func forTableView(array: [GoodsTableViewCellViewModel]) {
        output.itemsForTableView(array: array)
    }
    
}

extension InteractorInteractiveScreen: MakeBill {
    func printCheck(_ data: String) {
        output.readyPrintBill(data: data)
    }
}

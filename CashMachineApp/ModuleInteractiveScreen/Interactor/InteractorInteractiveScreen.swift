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
    var countService: CashMachine!

}

extension InteractorInteractiveScreen: InteractorInputInteractiveScreen {
    
    func registerItem(name: String, code: String, priceCurrency: String, priceValue: Double, tax: TaxMode) {
        do {
            try countService.register(item: RegisterableItem(name: name, code: code, price: Price(currencyUnit: priceCurrency, value: priceValue), tax: tax))
            output.occurSuccessfulAction("Registration was successful")
        } catch CashmashineErrors.repeatedRegistration {
            output.occurError(CashmashineErrors.repeatedRegistration.localizedDescription)
        } catch {
            output.occurError("Error")
        }
    }
    
    func scanItem(code: String, quantity: Double) {
        do {
            try countService.scan(item: ScannableItem(code: code, quantity: quantity))
            output.occurSuccessfulAction("Scan was successful")
        } catch let error as CashmashineErrors {
            output.occurError(error.localizedDescription)
            return
        } catch {
            output.occurError("Error")
        }
    }
    
    func pay() {
        countService.pay()
    }

    func dataOfItems() {
        let array = countService.dataOfScannedItem()
        output.readyInformationOnItems(array)
    }
}

extension InteractorInteractiveScreen: MakeBill {
    func printCheck(_ data: String) {
        output.readyBill(data: data)
    }
}

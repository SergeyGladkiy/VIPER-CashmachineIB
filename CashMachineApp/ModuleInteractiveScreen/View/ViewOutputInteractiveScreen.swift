//
//  ViewOutput.swift
//  Viper
//
//  Created by Serg on 13/04/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import Foundation

//в output'е вьюха сообщает что у нее произошло какое то событие, потом это идет на процессинг
// view берет ивенты от пользователя и помещает в свой output

protocol ViewOutputInteractiveScreen: class {
    func registerButtonTapped(name: String, code: String, priceCurrency: String, priceValue: Double, tax: TaxMode)  
    func scanButtonTapped(code: String, quantity: Double) throws
    func payButtonTapped(name: [String])
    func transitionButtonTapped()
}

//
//  InteractorInput.swift
//  Viper
//
//  Created by Serg on 13/04/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import Foundation

protocol InteractorInputInteractiveScreen {
    func registerItem(name: String, code: String, priceCurrency: String, priceValue: Double, tax: TaxMode)
    func scanItem(code: String, quantity: Double) 
    func pay()
    func dataOfItems()
}

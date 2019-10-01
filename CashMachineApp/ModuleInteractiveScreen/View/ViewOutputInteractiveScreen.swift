//
//  ViewOutput.swift
//  Viper
//
//  Created by Serg on 13/04/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import Foundation

protocol ViewOutputInteractiveScreen: class {
    func registerButtonTapped(name: String, code: String, priceCurrency: String, priceValue: Double, tax: TaxMode)  
    func scanButtonTapped(code: String, quantity: Double) throws
    func payButtonTapped()
    func transitionButtonTapped()
}

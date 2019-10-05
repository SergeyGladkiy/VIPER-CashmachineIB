//
//  Goods.swift
//  lesson9(CashMachine)
//
//  Created by Serg on 22/04/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import UIKit

class ShowableItem: InformationCellViewModel {
    private var name: String
    private var quantity: Double
    private var value: Double
    
    var information: String
    init(name: String, quantity: Double, value: Double) {
        self.name = name
        self.quantity = quantity
        self.value = value
        self.information = "\(name) - \(quantity) цена \(value)"
    }
}

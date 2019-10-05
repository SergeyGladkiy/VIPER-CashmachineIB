//
//  ScannedItem.swift
//  VIPER CashmachineIB
//
//  Created by Serg on 03/10/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import Foundation

class InformationItem {
    private var code: String
    var quantity: Double
    var name: String
    var value: Double
    
    init(code: String, quantity: Double, name: String, value: Double) {
        self.code = code
        self.quantity = quantity
        self.name = name
        self.value = value
    }
}

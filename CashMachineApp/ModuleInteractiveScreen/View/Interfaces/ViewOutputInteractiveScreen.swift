//
//  ViewOutput.swift
//  Viper
//
//  Created by Serg on 13/04/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import Foundation

protocol ViewOutputInteractiveScreen: class {
    
    func scanButtonTapped(code: String, quantity: Double)
    func payButtonTapped()
    func transitionButtonTapped()
}

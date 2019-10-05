//
//  ViewInput.swift
//  Viper
//
//  Created by Serg on 13/04/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import Foundation

protocol ViewInputInteractiveScreen: class {
    var output: ViewOutputInteractiveScreen {get set}
    func displayBill(data: String)
    func displayError(_ errorMessage: String)
    func displaySuccessfulAction(_ message: String)
}


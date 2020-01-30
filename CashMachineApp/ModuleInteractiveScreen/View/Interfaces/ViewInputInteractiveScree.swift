//
//  ViewInput.swift
//  Viper
//
//  Created by Serg on 13/04/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import Foundation
import UIKit

protocol ViewInputInteractiveScreen: UIViewController {
    var output: ViewOutputInteractiveScreen {get set}
    var maintainedRegister: (String, String, String, Double, TaxMode)-> Void {get set}
    func displayBill(data: String)
    func displayError(_ errorMessage: String)
    func displaySuccessfulAction(_ message: String)
}


//
//  IFieldDising.swift
//  lesson9(CashMachine)
//
//  Created by Serg on 11/04/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import UIKit

protocol IFieldDising {
    var borderStyle: UITextField.BorderStyle { get }
    var font: UIFont { get }
    var backgroundColor: UIColor { get }
    var textColor: UIColor { get }

    var bounds: AdjustingBounds? { get }
}

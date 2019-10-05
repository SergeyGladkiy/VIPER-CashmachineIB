//
//  ITextViewDisign.swift
//  VIPER CashmachineIB
//
//  Created by Serg on 05/10/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import Foundation
import UIKit

protocol ITextViewDesign {
    var bounds: AdjustingBounds { get }
    var font: UIFont { get }
    var isEditable: Bool { get }
    var backgroundColor: UIColor { get }
    var textColor: UIColor { get }
    var textAlignment: NSTextAlignment { get }
}

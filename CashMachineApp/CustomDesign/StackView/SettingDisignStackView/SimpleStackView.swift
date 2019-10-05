//
//  SimpleView.swift
//  VIPER CashmachineIB
//
//  Created by Serg on 03/10/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import Foundation
import UIKit

class SettingStackView: IStackViewDisign {
    var backgroundColor: UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    var bounds = AdjustingBounds(borderWidth: 2,cornerRadius: 5, margin: nil)
}

class SimpleStackView: StackView {
    override func buildDesign() -> IStackViewDisign {
        return SettingStackView()
    }
}


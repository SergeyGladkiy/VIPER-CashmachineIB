//
//  New.swift
//  lesson9(CashMachine)
//
//  Created by Serg on 07/04/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import UIKit

class SettingSimpleButton: IButtonDisign {
    var state: UIControl.State = .normal
    var font: UIFont = UIFont.italicSystemFont(ofSize: 21)
    var backgroundColor: UIColor = #colorLiteral(red: 0, green: 0.3285208941, blue: 0.5748849511, alpha: 1)
    var textColor: UIColor = .white
    var bounds = AdjustingBounds(borderWidth: 2,cornerRadius: 5, margin: UIEdgeInsets(top: 1, left: 3, bottom: 1, right: 3) )
}

class SimpleButton: Button {
    override func buildDesign() -> IButtonDisign {
        return SettingSimpleButton()
    }
}

//
//  AdjustingLabel.swift
//  lesson9(CashMachine)
//
//  Created by Serg on 11/04/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import UIKit

class SettingLabel: ILabelDisign {
    let font: UIFont
    let textColor: UIColor
    
    init(font: UIFont, textColor: UIColor) {
        self.font = font
        self.textColor = textColor
    }
}

class SimpleLabel: Label {
    override func buildDisign() -> ILabelDisign {
        return SettingLabel(font: UIFont.init(name: "Arial", size: 23) ?? .systemFont(ofSize: 23), textColor: .black)
    }
}

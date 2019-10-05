//
//  AdjustingLabel.swift
//  lesson9(CashMachine)
//
//  Created by Serg on 11/04/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import UIKit

class SettingSimpleLabel: ILabelDisign {
    var font: UIFont = UIFont.init(name: "Arial", size: 23) ?? .systemFont(ofSize: 23)
    var textColor: UIColor = .black
}

class SimpleLabel: Label {
    override func buildDisign() -> ILabelDisign {
        return SettingSimpleLabel()
    }
}

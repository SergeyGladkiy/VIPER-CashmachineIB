//
//  AdjustingLabel.swift
//  lesson9(CashMachine)
//
//  Created by Serg on 11/04/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import UIKit

class SettingSimpleLabel: ILabelDising {
    var font: UIFont = UIFont.init(name: "Arial", size: 23) ?? .systemFont(ofSize: 23)
    var textColor: UIColor = .white
}

class SimpleLabel: Label {
    override func buildDising() -> ILabelDising {
        return SettingSimpleLabel()
    }
}

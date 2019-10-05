//
//  SimpleTextView.swift
//  VIPER CashmachineIB
//
//  Created by Serg on 05/10/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import Foundation
import UIKit

class SettingSimpleTextView: ITextViewDesign {
    var isEditable: Bool = false
    var textAlignment: NSTextAlignment = .left
    var font: UIFont = UIFont.init(name: "Arial", size: 20) ?? .systemFont(ofSize: 20)
    var backgroundColor: UIColor = .white
    var textColor: UIColor = .black
    var bounds = AdjustingBounds(borderWidth: 1,cornerRadius: 5, margin: nil)
}

class SimpleTextView: TextView {
    override func buildDesign() -> ITextViewDesign {
        return SettingSimpleTextView()
    }
}

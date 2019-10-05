//
//  RegisteredField.swift
//  lesson9(CashMachine)
//
//  Created by Serg on 11/04/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import UIKit

class SettingSimpleField: IFieldDisign {
    var borderStyle: UITextField.BorderStyle = .roundedRect
    var font: UIFont = UIFont.init(name: "Arial", size: 20) ?? .systemFont(ofSize: 20)
    var backgroundColor: UIColor = .white
    var textColor: UIColor = .black
    
    var bounds: AdjustingBounds? = AdjustingBounds(borderWidth: 1, cornerRadius: 4, margin: nil)
}

class SimpleField: Field {
    override func buildDesign() -> IFieldDisign {
        return SettingSimpleField()
    }
}

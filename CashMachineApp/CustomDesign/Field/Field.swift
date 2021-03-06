//
//  Field.swift
//  lesson9(CashMachine)
//
//  Created by Serg on 11/04/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import UIKit

class Field: UITextField {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let design = buildDesign()
        textColor = design.textColor
        font = design.font
        backgroundColor = design.backgroundColor
        borderStyle = design.borderStyle
        clearButtonMode = UITextField.ViewMode.unlessEditing
        layer.borderWidth = design.bounds!.borderWidth
        layer.cornerRadius = design.bounds!.cornerRadius
        
    }
    
    func buildDesign() -> IFieldDisign {
        fatalError("переопредели со своим дизайном, не используй в SB этот custom class")
    }
}

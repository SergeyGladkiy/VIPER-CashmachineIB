//
//  TextView.swift
//  VIPER CashmachineIB
//
//  Created by Serg on 03/10/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import Foundation
import UIKit

class TextView: UITextView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let design = buildDesign()
        font = design.font
        textColor = design.textColor
        textAlignment = design.textAlignment
        isEditable = design.isEditable
        backgroundColor = design.backgroundColor
        layer.cornerRadius = design.bounds.cornerRadius
        layer.borderWidth = design.bounds.borderWidth
        
    }
    
    func buildDesign() -> ITextViewDesign {
        fatalError("переопредели со своим дизайном, не используй в SB этот custom class")
    }
}

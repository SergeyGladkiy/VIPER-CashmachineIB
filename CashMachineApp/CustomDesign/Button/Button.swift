//
//  Button.swift
//  lesson9(CashMachine)
//
//  Created by Serg on 08/04/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import UIKit

class Button: UIButton {
    
    override func layoutSubviews() {    
        super.layoutSubviews()
        let design = buildDesign()
        layer.cornerRadius = design.bounds.cornerRadius
        layer.borderWidth = design.bounds.borderWidth
        titleLabel?.font = design.font
        setTitleColor(design.textColor, for: design.state)
        //backgroundColor = design.backgroundColor
        guard let margin = design.bounds.margin else {
            fatalError("don't forget about margin")
        }
        contentEdgeInsets = margin
        
        
    }
    
    func buildDesign() -> IButtonDisign {
        fatalError("переопредели со своим дизайном, не используй в SB этот custom class")
    }
}

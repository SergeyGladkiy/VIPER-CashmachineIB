//
//  Label.swift
//  lesson9(CashMachine)
//
//  Created by Serg on 11/04/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import UIKit

class Label: UILabel {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let design = buildDisign()
        textColor = design.textColor
        font = design.font
    }
    
    func buildDisign() -> ILabelDisign {
        fatalError("переопредели со своим дизайном, не используй в SB этот custom class")
    }
}



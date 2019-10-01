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
        let desing = buildDising()
        textColor = desing.textColor
        font = desing.font
    }
    
    func buildDising() -> ILabelDising {
        fatalError("переопредели со своим дизайном, редиска")
    }
}



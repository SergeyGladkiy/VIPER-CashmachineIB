//
//  TableView.swift
//  VIPER CashmachineIB
//
//  Created by Serg on 05/10/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import Foundation
import UIKit

class SegmentedControl: UISegmentedControl {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let design = buildDesign()
        tintColor = design.tintColor
        layer.cornerRadius = design.bounds.cornerRadius
        layer.borderWidth = design.bounds.borderWidth
    }
    
    func buildDesign() -> ISegmentedDesign {
        fatalError("переопредели со своим дизайном, не используй в SB этот custom class")
    }
}

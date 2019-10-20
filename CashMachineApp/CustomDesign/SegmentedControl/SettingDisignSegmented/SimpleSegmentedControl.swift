//
//  SettingDesignSegmented.swift
//  VIPER CashmachineIB
//
//  Created by Serg on 06/10/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import Foundation
import UIKit

class SettingDisignSegmented: ISegmentedDesign {
    var tintColor: UIColor
    var bounds: AdjustingBounds
    
    init(tint: UIColor, bounds: AdjustingBounds) {
        self.tintColor = tint
        self.bounds = bounds
    }
}

class SimpleSegmentedControl: SegmentedControl {
    override func buildDesign() -> ISegmentedDesign {
        return SettingDisignSegmented(tint: #colorLiteral(red: 0, green: 0.3285208941, blue: 0.5748849511, alpha: 1), bounds: AdjustingBounds(borderWidth: 1, cornerRadius: 5, margin: nil))
    }
}

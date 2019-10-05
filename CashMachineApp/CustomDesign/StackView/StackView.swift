//
//  StackView.swift
//  VIPER CashmachineIB
//
//  Created by Serg on 01/10/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import Foundation
import UIKit

class StackView: UIStackView {
    
    
    // for coding init needs add alignment, distribution, axis and s.e.
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let design = buildDesign()
        add(view: design)
    }
    
    func add(view: IStackViewDisign) {
        let subView = UIView(frame: bounds)
        subView.backgroundColor = view.backgroundColor
        subView.layer.borderWidth = view.bounds.borderWidth
        subView.layer.cornerRadius = view.bounds.cornerRadius
        subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(subView, at: 0)
    }
    
    func buildDesign() -> IStackViewDisign {
       fatalError("переопредели со своим дизайном, не используй в SB этот custom class")
    }
}

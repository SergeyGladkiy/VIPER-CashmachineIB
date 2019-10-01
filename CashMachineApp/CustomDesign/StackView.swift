//
//  StackView.swift
//  VIPER CashmachineIB
//
//  Created by Serg on 01/10/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import Foundation
import UIKit

class CustomStackView: UIStackView {
    func addBackground(color: UIColor) {
        let subView = UIView(frame: bounds)
        subView.backgroundColor = color
        subView.layer.borderWidth = 2
        subView.layer.cornerRadius = 7
        subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(subView, at: 0)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addBackground(color: #colorLiteral(red: 0.7915118511, green: 0.5045410129, blue: 0.5104175027, alpha: 1))
    }
}

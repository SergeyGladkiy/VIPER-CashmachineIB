//
//  GoodsTableViewCell.swift
//  lesson9(CashMachine)
//
//  Created by Serg on 22/04/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import UIKit

protocol GoodsTableViewCellViewModel: class {
    var name: String { get }
}

class GoodsTableViewCell: UITableViewCell {
    
    
    @IBOutlet private weak var nameLabel: UILabel!
    
    weak var viewModel: GoodsTableViewCellViewModel? {
        didSet {
            nameLabel.text = viewModel?.name
        }
    }
}

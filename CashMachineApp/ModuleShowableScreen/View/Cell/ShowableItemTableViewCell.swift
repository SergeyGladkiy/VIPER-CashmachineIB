//
//  GoodsTableViewCell.swift
//  lesson9(CashMachine)
//
//  Created by Serg on 22/04/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import UIKit

class ShowableItemTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var nameLabel: UILabel!
    
    weak var viewModel: InformationCellViewModel? {
        didSet {
            nameLabel.text = viewModel?.information
        }
    }
}

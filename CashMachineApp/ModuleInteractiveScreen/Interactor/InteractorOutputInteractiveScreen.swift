//
//  InteractorOutput.swift
//  Viper
//
//  Created by Serg on 13/04/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import Foundation

protocol InteractorOutputInteractiveScreen {
    func readyPrintBill(data: String)
    func occurError(_ errorMessage: String)
    func itemsForTableView(array: [GoodsTableViewCellViewModel])
}



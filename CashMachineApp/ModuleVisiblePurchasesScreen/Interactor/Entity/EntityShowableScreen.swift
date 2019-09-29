//
//  EntityShowableScreen.swift
//  VIPER CashmachineIB
//
//  Created by Serg on 29/09/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import Foundation

class EntityShowableScreen {
    var arrayItems = [GoodsTableViewCellViewModel]()
    var onDeleted: ((Int)-> Void)!
    
    func remove(at: Int) {
        arrayItems.remove(at: at)
        onDeleted(at)
    }
}

//
//  InteractorShowableScreen.swift
//  VIPER CashmachineIB
//
//  Created by Serg on 28/09/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import Foundation

class InteractorShowableScreen {
    weak var output: InteractorOutputShowableScreen!
    var entity: EntityShowableScreen!
    
}

extension InteractorShowableScreen: InteractorInputShowableScreen {
    func prepareShowableItems() {
        output.readyItems(entity.arrayItems)
    }
    
    func remove(at: Int) {
        entity.remove(at: at)
        output.deletedItem(at)
    }
}

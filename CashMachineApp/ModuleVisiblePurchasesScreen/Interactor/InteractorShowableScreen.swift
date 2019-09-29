//
//  InteractorShowableScreen.swift
//  VIPER CashmachineIB
//
//  Created by Serg on 28/09/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import Foundation

class InteractorShowableScreen {
    var output: InteractorOutputShowableScreen!
    var entity: EntityShowableScreen!
    
}

extension InteractorShowableScreen: InteractorInputShowableScreen {
    func prepareData() {
        output.readyItems(entity.arrayItems)
    }
    
    func remove(at: Int) {
        entity.remove(at: at)
        output.readyItems(entity.arrayItems)
    }
    
}

//
//  MapperInteractiveScreen.swift
//  VIPER CashmachineIB
//
//  Created by Serg on 03/10/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import Foundation

class MapperInteractiveScreen: IMapperInteractiveScreen {
    func prepareItemsForRouting(_ array: [InformationItem]) -> [InformationCellViewModel] {
        var items = [InformationCellViewModel]()
        items = array.map { i in
            ShowableItem(name: i.name, quantity: i.quantity, value: i.value)
        }
        return items
    }
    
    
}

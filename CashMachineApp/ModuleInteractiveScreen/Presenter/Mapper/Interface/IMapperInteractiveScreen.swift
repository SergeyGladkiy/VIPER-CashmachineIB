//
//  MapperProtocol.swift
//  VIPER CashmachineIB
//
//  Created by Serg on 03/10/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import Foundation

protocol IMapperInteractiveScreen {
    func prepareItemsForRouting(_ array: [InformationItem]) -> [InformationCellViewModel]
}

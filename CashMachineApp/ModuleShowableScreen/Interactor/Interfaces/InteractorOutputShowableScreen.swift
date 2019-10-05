//
//  InteractorOutputShowableScreen.swift
//  VIPER CashmachineIB
//
//  Created by Serg on 28/09/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import Foundation

protocol InteractorOutputShowableScreen: class {
    func deletedItem(_ number: Int)
    func readyItems(_ array: [InformationCellViewModel])
}

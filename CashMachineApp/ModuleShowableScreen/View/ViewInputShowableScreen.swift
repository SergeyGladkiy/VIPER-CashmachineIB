//
//  ViewInputShowableScree.swift
//  VIPER CashmachineIB
//
//  Created by Serg on 28/09/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import Foundation

protocol ViewInputShowableScreen: class {
    var output: ViewOutputShowableScreen { get set }
    func deleteIndexPath(row: Int)
}

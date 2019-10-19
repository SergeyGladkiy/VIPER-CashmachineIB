//
//  ViewInputShowableScree.swift
//  VIPER CashmachineIB
//
//  Created by Serg on 28/09/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import Foundation
import UIKit

protocol ViewInputShowableScreen: UIViewController {
    var output: ViewOutputShowableScreen { get set }
    func deleteIndexPath(row: Int)
    func setDataOfItems(_ array: [InformationCellViewModel])
}

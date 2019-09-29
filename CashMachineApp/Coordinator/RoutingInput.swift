//
//  IRouterInput.swift
//  Viper
//
//  Created by Serg on 13/04/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import Foundation
import UIKit

protocol RoutingInput {
    func start() -> UIViewController
    func showShoppingItems(_ arrayGoods: [GoodsTableViewCellViewModel])
    func back()
}

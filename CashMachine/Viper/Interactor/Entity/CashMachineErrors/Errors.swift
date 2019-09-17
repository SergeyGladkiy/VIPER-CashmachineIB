//
//  Errors.swift
//  VIPER CashMachine1
//
//  Created by Serg on 30/04/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import Foundation

enum CashmashineErrors {
    case goodsNotFound
}

extension CashmashineErrors: Error {
    var localizedDescription: String {
        switch self {
        case .goodsNotFound:
            return "код не найден в зарегистрированной базе товаров"
        }
    }
}

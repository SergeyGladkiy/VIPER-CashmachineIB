//
//  DependenceProvider.swift
//  VIPER CashmachineIB
//
//  Created by Serg on 20/10/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import Foundation
import Swinject

class DependenceProvider {
    private static let assembler = Assembler([CountServiceAssambly(), AppCoordinatorAssambly(), InteractiveScreenAssambly(), ShowableScreenAssambly()])
    
    static func resolve<T>() -> T {
        return DependenceProvider.assembler.resolver.resolve(T.self)!
    }
}

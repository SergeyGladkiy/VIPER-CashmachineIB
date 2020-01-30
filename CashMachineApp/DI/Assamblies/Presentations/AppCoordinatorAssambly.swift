//
//  AppCoordinatorAssambly.swift
//  VIPER CashmachineIB
//
//  Created by Serg on 20/10/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import Foundation
import Swinject

class AppCoordinatorAssambly: Assembly {
    func assemble(container: Container) {
        container.register(AppCoordinatroProtocol.self) { _ in AppCoordinator() }.inObjectScope(.container)
    }
}

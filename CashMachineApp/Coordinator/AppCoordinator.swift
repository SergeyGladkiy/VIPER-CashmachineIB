//
//  AppCoordinator.swift
//  VIPER CashmachineIB
//
//  Created by Serg on 28/09/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator {
    private var window: UIWindow!
    private var rootRouter: RoutingInput!
}

extension AppCoordinator: AppCoordinatroProtocol {
    func prepareWindow() -> UIWindow? {
        rootRouter = DependenceProvider.resolve()
        window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = rootRouter.start()
        window.makeKeyAndVisible()
        return window
    }
}

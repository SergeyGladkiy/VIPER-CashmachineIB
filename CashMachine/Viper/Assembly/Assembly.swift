//
//  File.swift
//  VIPER CashmachineIB
//
//  Created by Serg on 20/05/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import UIKit

class Assembly {
    func build(vc: ViewControllerIB) {
        let interactor = Interactor()
        let router = Router()
        let view = vc
        
        //  через сториборду получаем контроллер
        //_ = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ControllerForTableView") as! ControllerForTableView
        let presenter = Presenter(interactor: interactor, router: router, viewInput: view)
        let cashMachine = CashMachineAssembly.build(device: interactor , credentials: "Tanaeva Kristina Aleksandrovna")
        view.output = presenter
        interactor.output = presenter
        interactor.entity = cashMachine
        
    }
    
}



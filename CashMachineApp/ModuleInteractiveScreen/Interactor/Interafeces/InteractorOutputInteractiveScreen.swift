//
//  InteractorOutput.swift
//  Viper
//
//  Created by Serg on 13/04/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import Foundation

protocol InteractorOutputInteractiveScreen: class {
    var readyData: (String)-> Void { get set }
    func occurError(_ errorMessage: String)
    func occurSuccessfulAction(_ message: String)
    func readyInformationOnItems(_ array: [InformationItem])
}

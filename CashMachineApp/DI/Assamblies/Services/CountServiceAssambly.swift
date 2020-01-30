//
//  CoutnServiceAssambly.swift
//  VIPER CashmachineIB
//
//  Created by Serg on 20/10/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import Foundation
import Swinject

class CountServiceAssambly: Assembly {
    func assemble(container: Container) {
        container.register(TaxCalculator.self) { _ in Calculator() }
        container.register(Scanner.self) { _ in ScannerUnit() }
        container.register(IMapper.self) { _ in Mapper() }
        container.register(BillPrinter.self) { r in
            Printer(check: r.resolve(MakeBill.self)!)
        }
        container.register(CashMachine.self) { r in
            let scanner = r.resolve(Scanner.self)!
            let calculator = r.resolve(TaxCalculator.self)!
            let mapper = r.resolve(IMapper.self)!
            let billPrinter = r.resolve(BillPrinter.self)!
            let credentials = "Tanaeva Kristina Aleksandrovna"
            return CashMachine(scanner: scanner, taxCalculator: calculator, billPrinter: billPrinter, mapper: mapper, cashierCredentials: credentials) }.inObjectScope(.container)
    }
}

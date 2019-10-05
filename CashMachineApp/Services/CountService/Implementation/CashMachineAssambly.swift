//
//  CashMachineAssambly.swift
//  CashMachine
//
//  Created by Serg on 18/03/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import Foundation

class CashMachineAssembly {
    static func build(device: MakeBill, credentials: String) -> CashMachine {
        let taxC = Calculator()
        let billP = Printer(check: device)
        let scanner = ScannerUnit()
        let mapper = Mapper()
        let machine = CashMachine(scanner: scanner, taxCalculator: taxC, billPrinter: billP, mapper: mapper, cashierCredentials: credentials)
        scanner.scannerDeleg = machine
        return machine
    }
}

//
//  CashMachine.swift
//  CashMachine
//
//  Created by Serg on 17/03/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import Foundation

class CashMachine {
    
    private var registeredGoods: [RegisterableItem] = []
    private var shoplist: [ScannableItem] = []
    
    private var cashierCredentials: String
    
    private let scanner: Scanner
    private let taxCalculator: TaxCalculator
    private let billPrinter: BillPrinter
    private let mapper: IMapper
    
    init(scanner: Scanner, taxCalculator: TaxCalculator, billPrinter: BillPrinter, mapper: IMapper, cashierCredentials: String) {
        self.scanner = scanner
        self.taxCalculator = taxCalculator
        self.billPrinter = billPrinter
        self.mapper = mapper
        self.cashierCredentials = cashierCredentials
    }
    
    private func sumShopList() -> Double {
        var sum = 0.0
        for i in shoplist {
            for j in registeredGoods {
                if j.code == i.code {
                    sum += i.quantity * j.price.value
                }
            }
        }
        return sum
    }
    
    func pay() {
        let taxableItems = mapper.makeTaxableItems(scannedGoods: shoplist, registeredGoods: registeredGoods)
        let printableItems = mapper.makePrintableItems(scannedGoods: shoplist, registeredGoods: registeredGoods)
        let sumTax = taxCalculator.countTax(array: taxableItems)
        let amount = sumShopList()
        let fullAmount = sumTax + amount
        let bill = billPrinter.countBill(array: printableItems, cachierInf: cashierCredentials, totalTax: sumTax, sum: fullAmount)
       billPrinter.printCheck(bill)
        shoplist = [ScannableItem]()
    }
    
    func dataOfScannedItem() -> [InformationItem] {
        return mapper.information(scannedGoods: shoplist, registeredGoods: registeredGoods)
    }
    
    func removeScannedItem(index: Int) {
        shoplist.remove(at: index)
    }
}



extension CashMachine: ScannerDelegate {
    
    func register(item: RegisterableItem) throws {
        // регистрируемое проверяем в массиве зарегистрированнх
        for i in registeredGoods {
            if i.code == item.code {
                throw CashmashineErrors.repeatedRegistration
            }
        }
        registeredGoods.append(item)
    }
    
    func scan(item: ScannableItem) throws  { // throws должна быть помечина
        // ищем товар в отсканированных и если находим увеличиваем кол-во
        for i in 0..<shoplist.count {
            if item.code == shoplist[i].code {
                shoplist[i].quantity += item.quantity
                return
            }
        }
        for i in registeredGoods[0..<registeredGoods.count] {
            if i.code == item.code {
                shoplist.append(item)
                return
            }
        }
        throw CashmashineErrors.goodsNotFound
    }
}



    

    

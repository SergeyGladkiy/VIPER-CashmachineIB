//
//  Mapper.swift
//  CashMachine
//
//  Created by Serg on 23/03/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import Foundation

class Mapper {
    
}

extension Mapper: IMapper {
    
    func makeTaxableItems(scannedGoods: [ScannableItem], registeredGoods: [RegisterableItem]) -> [TaxableItem] {
        var arTaxableItems = [TaxableItem]()
        for i in scannedGoods {
            for j in registeredGoods {
                if i.code == j.code {
                    switch j.tax {
                    case .Excise: arTaxableItems.append(TaxableItem(price: j.price.value, quantity: i.quantity, taxes: .Excise))
                    case .NDS: arTaxableItems.append(TaxableItem(price: j.price.value, quantity: i.quantity, taxes: .NDS))
                    }
                }
            }
        }
        return arTaxableItems
    }
    
    func makePrintableItems(scannedGoods: [ScannableItem], registeredGoods: [RegisterableItem]) -> [PrintableItem] {
        var arPrintableItems = [PrintableItem]()
        for i in scannedGoods {
            for j in registeredGoods {
                if i.code == j.code {
                    arPrintableItems.append(PrintableItem(code: i.code, name: j.name, quantity: i.quantity, priceValue: j.price.value))
                }
            }
        }
        return arPrintableItems
    }
    
    func makeMainItems(name: [String], printableItems: [PrintableItem]) -> [MainItem] {
        var arrayMainItems = [MainItem]()
        for i in name {
            for j in printableItems {
                if i == j.name {
                arrayMainItems.append(MainItem(code: j.code, name: i, quantity: j.quantity, priceValue: j.priceValue))
                }
            }
        }
        return arrayMainItems
    }
    
    func makeDemonstrationItems(scannedGoods: [ScannableItem], registeredGoods: [RegisterableItem]) -> [GoodsTableViewCellViewModel] {
        var arrayTableView = [GoodsTableViewCellViewModel]()
        for i in scannedGoods {
            for j in registeredGoods {
                if i.code == j.code {
                    arrayTableView.append(Goods(name: "\(j.name)"))
                }
            }
        }
        return arrayTableView
    }
    
}

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
    
    func information(scannedGoods: [ScannableItem], registeredGoods: [RegisterableItem]) -> [GoodsTableViewCellViewModel] {
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

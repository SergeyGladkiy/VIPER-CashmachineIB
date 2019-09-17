//
//  ViewInput.swift
//  Viper
//
//  Created by Serg on 13/04/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import Foundation

// по результатам процессинга в input сообщается о том что нужно что то изменить
// (по кешмашине) печатает чек
// чтобы не было нарушения разворачивания зависимостей нужно ((без var outPut: ViewOutput {get set}) зависел не на абстракцию, а на конкретную имплиментацию
// проксирование!!! не забыть повторить


protocol ViewInput: class {
    
    var output: ViewOutput {get set}
    func displayBill(data: String)
    func displayError(_ errorMessage: String)
    func demonstrationItemsforTableView(array: [GoodsTableViewCellViewModel])
    
}


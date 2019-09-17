//
//  ViewController.swift
//  lesson9(CashMachine)
//
//  Created by Serg on 23/03/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import UIKit

class ViewControllerIB: UIViewController {
    
    private weak var outPut: ViewOutput!
    
    
    @IBOutlet private weak var name: UITextField!
    @IBOutlet private weak var registeredCode: UITextField!
    @IBOutlet private weak var currencyUnit: UITextField!
    @IBOutlet private weak var value: UITextField!
    
    @IBOutlet weak var taxModeSegment: UISegmentedControl!
    
    @IBOutlet weak var scannableCode: UITextField!
    @IBOutlet private weak var quantity: UITextField!
    
    @IBOutlet weak var register: UIButton!
    @IBOutlet weak var scan: UIButton!
    @IBOutlet weak var pay: UIButton!
    @IBOutlet weak var toShoppingList: UIButton!
    
    @IBOutlet private weak var textView: UITextView!
    
    
    private var arrayGoods = [GoodsTableViewCellViewModel]()
    private var mainArrayGoods = [GoodsTableViewCellViewModel]()
    
    // второй вариант: сегвей от контроллера, через идентификатор, с использованием @IBAction
     @IBAction func sendPressed(button: UIButton) {
        performSegue(withIdentifier: "detailSegue", sender: nil) // идентификотор указываем у сегвея в сториборде
     }
    
    @IBAction func unwindToMainScreen(segue: UIStoryboardSegue) {
        guard segue.identifier == "unwindSegue" else { return }
        guard let svc = segue.source as? ControllerForTableView else { return }
        mainArrayGoods = svc.goodsArray
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let controllerForTableView = segue.destination as? ControllerForTableView else { return }
        controllerForTableView.goodsArray = arrayGoods
    }
   
    
    let assembler = Assembly()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assembler.build(vc: self)
        view.backgroundColor = .gray
        layout()
        
        

    }
    
    private func layout() {
        register.layer.borderWidth = 1
        register.layer.cornerRadius = 5
        
        scan.layer.borderWidth = 1
        scan.layer.cornerRadius = 5
        
        pay.layer.borderWidth = 1
        pay.layer.cornerRadius = 5
        
        //textView.layer.borderWidth = 1
        //textView.layer.cornerRadius = 5
        
        toShoppingList.layer.borderWidth = 1
        toShoppingList.layer.cornerRadius = 5
        
        //taxModeSegment.insertSegment(withTitle: "0,13432", at: 0, animated: true) пример добавления через код
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    private func clearRegistableText() {
        name.text = nil
        registeredCode.text = nil
        currencyUnit.text = nil
        value.text = nil
    }
    
    private func cleanScanText() {
        scannableCode.text = nil
        quantity.text = nil
    }
    
    
    @IBAction private func register(_ sender: UIButton) {
        
        if name.text! == "" {
            textView.text = "Пустое поле name"
            return
        }
        
        if registeredCode.text! == "" {
            textView.text = "Пустое поле code"
            return
        }
        
        if currencyUnit.text! == "" {
            textView.text = "Пустое поле currency"
            return
        }
        
        guard let name = name.text else {
            return
        }
        guard let code = registeredCode.text else {
            return
        }
        guard let currency = currencyUnit.text else {
            return
        }
        
        guard let value =  Double(value.text!) else {
            textView.text = "В поле value введите число"
            return
        }
        

        switch taxModeSegment.selectedSegmentIndex {
        case 0:
            outPut.registerButtonTapped(name: name, code: code, priceCurrency: currency, priceValue: value, tax: .NDS)
            clearRegistableText()
        case 1:
            outPut.registerButtonTapped(name: name, code: code, priceCurrency: currency, priceValue: value, tax: .Excise)
            clearRegistableText()
        default:
            textView.text = "Выберите режим налогообложения (0.1 для НДС или 100 для акциза)"
        }
    }
    
    @IBAction private func scan(_ sender: UIButton) {
        
        if scannableCode.text! == "" {
            textView.text = "Пустое поле code"
            return
        }
        
        guard let code = scannableCode.text else {
            return
        }
        
        guard let quantity =  Double(quantity.text!) else {
            textView.text = "В поле quantity введите число"
            return
        }
        
        do {
            textView.text = ""
            try outPut.scanButtonTapped(code: code, quantity: quantity)
            cleanScanText()
        } catch let error as CashmashineErrors {
            displayError(error.localizedDescription)
        } catch {
            displayError("Error")
        }
    }
    
    @IBAction private func pay(_ sender: UIButton) {
        
        var arrrayGoods = [String]()
        for item in mainArrayGoods[0..<mainArrayGoods.count] {
            arrrayGoods.append(item.name)
        }
        outPut.payButtonTapped(name: arrrayGoods)
    }
    
    
    
}

extension ViewControllerIB: ViewInput {
    
    var output: ViewOutput {
        get {
            return outPut
        }
        set {
            outPut = newValue
        }
    }
    
    func displayBill(data: String) {
        textView.text = data
    }
    
    func displayError(_ errorMessage: String) {
        
        let alert = UIAlertController(title: "Wrong format", message: errorMessage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func demonstrationItemsforTableView(array: [GoodsTableViewCellViewModel]) {
        arrayGoods = array
    }
    
}


extension ViewControllerIB {
    
    
//    первый вариант передачи через кнопку
//    здесь мы готовим переход
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let controllerForTableView = segue.destination as? ControllerForTableView else { return }
//        controllerForTableView.goodsArray = arrayGoods
//    }
    
}

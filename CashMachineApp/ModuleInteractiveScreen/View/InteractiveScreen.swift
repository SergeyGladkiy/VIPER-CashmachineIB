//
//  ViewController.swift
//  lesson9(CashMachine)
//
//  Created by Serg on 23/03/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import UIKit

class InteractiveScreen: UIViewController {
    
    private weak var outputView: ViewOutputInteractiveScreen!
    
    @IBOutlet private weak var name: UITextField!
    @IBOutlet private weak var registeredCode: UITextField!
    @IBOutlet private weak var currencyUnit: UITextField!
    @IBOutlet private weak var value: UITextField!
    @IBOutlet private weak var taxModeSegment: UISegmentedControl!
    @IBOutlet private weak var scannableCode: UITextField!
    @IBOutlet private weak var quantity: UITextField!
    
    @IBOutlet weak var labelValue: UILabel!
    
    @IBOutlet weak var labelTaxMode: UILabel!
    
    @IBOutlet private weak var textView: UITextView!
    
    @IBOutlet weak var scroll: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
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
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print(aDecoder)
        print(self.nibName as Any)
        
    }
}

extension InteractiveScreen {
    
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
            outputView.registerButtonTapped(name: name, code: code, priceCurrency: currency, priceValue: value, tax: .NDS)
            clearRegistableText()
        case 1:
            outputView.registerButtonTapped(name: name, code: code, priceCurrency: currency, priceValue: value, tax: .Excise)
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
            try outputView.scanButtonTapped(code: code, quantity: quantity)
            cleanScanText()
        } catch let error as CashmashineErrors {
            displayError(error.localizedDescription)
        } catch {
            displayError("Error")
        }
    }
    
    @IBAction func transitionToList(_ sender: UIButton) {
        outputView.transitionButtonTapped()
    }
    
    @IBAction func pay(_ sender: UIButton) {
        output.payButtonTapped()
    }
}

extension InteractiveScreen: ViewInputInteractiveScreen {
    
    var output: ViewOutputInteractiveScreen {
        get {
            return outputView
        }
        set {
            outputView = newValue
        }
    }
    
    func displayBill(data: String) {
        print(data)
        textView.text = data
    }
    
    func displaySuccessfulAction(_ message: String) {
        textView.text = message
    }
    
    func displayError(_ errorMessage: String) {
        
        let alert = UIAlertController(title: "Wrong format", message: errorMessage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
}

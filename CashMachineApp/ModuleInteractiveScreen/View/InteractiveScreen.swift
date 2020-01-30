//
//  ViewController.swift
//  lesson9(CashMachine)
//
//  Created by Serg on 23/03/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import UIKit

class InteractiveScreen: UIViewController {
    
    private var outputView: ViewOutputInteractiveScreen!
    
    private var registerButtonTapped: ((String, String, String, Double, TaxMode)-> Void)!
    
    @IBOutlet private weak var name: UITextField!
    @IBOutlet private weak var registeredCode: UITextField!
    @IBOutlet private weak var currencyUnit: UITextField!
    @IBOutlet private weak var value: UITextField!
    @IBOutlet private weak var taxModeSegment: UISegmentedControl!
    @IBOutlet private weak var scannableCode: UITextField!
    @IBOutlet private weak var quantity: UITextField!
    
    @IBOutlet private weak var textView: UITextView!
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print(aDecoder)
        print(self.nibName as Any)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print(#function)
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
            registerButtonTapped(name, code, currency, value, .NDS)
            clearRegistableText()
        case 1:
            registerButtonTapped(name, code, currency, value, .Excise)
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
        outputView.scanButtonTapped(code: code, quantity: quantity)
        cleanScanText()
    }
    
    @IBAction func transitionToList(_ sender: UIButton) {
        outputView.transitionButtonTapped()
    }
    
    @IBAction private func pay(_ sender: UIButton) {
        outputView.payButtonTapped()
    }
}

extension InteractiveScreen: ViewInputInteractiveScreen {
    var maintainedRegister: (String, String, String, Double, TaxMode) -> Void {
        get {
            return registerButtonTapped
        }
        set {
            registerButtonTapped = newValue
        }
    }
    
    
    var output: ViewOutputInteractiveScreen {
        get {
            return outputView
        }
        set {
            outputView = newValue
        }
    }
    
    func displayBill(data: String) {
        textView.text = data
    }
    
    func displaySuccessfulAction(_ message: String) {
        textView.text = message
    }
    
    func displayError(_ errorMessage: String) {
        textView.text = ""
        let alert = UIAlertController(title: "Wrong format", message: errorMessage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
}

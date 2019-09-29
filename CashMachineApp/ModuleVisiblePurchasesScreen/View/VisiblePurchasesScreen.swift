//
//  ControlllerForTableView.swift
//  VIPER CashmachineIB
//
//  Created by Serg on 21/05/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import UIKit

class ShowableScreen: UIViewController {
    
    private var outputView: ViewOutputShowableScreen!
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var goodsArray = [GoodsTableViewCellViewModel]()
    
//    @IBAction func backward(_ sender: UIButton) {
//        performSegue(withIdentifier: "unwindSegue", sender: nil)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        layout()
        setUpUI()
        
        
    }
    
    private func layout() {
        tableView.layer.borderWidth = 1
        tableView.layer.cornerRadius = 5
        
    }
}

extension ShowableScreen {
    
    @IBAction func backward(_ sender: UIButton) {
        outputView.backToInteractive()
    }
    
    private func setUpUI() {
        let nib = UINib(nibName: "GoodsTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "GoodsTableViewCell")
        tableView.dataSource = self
        tableView.reloadData()
    }
}

extension ShowableScreen: ViewInputShowableScreen {
    var output: ViewOutputShowableScreen {
        get {
            return outputView
        }
        set {
            outputView = newValue
        }
    }
    
    func displayItems(_ array: [GoodsTableViewCellViewModel]) {
        goodsArray = array
    }
    
    
    
}

extension ShowableScreen: UITableViewDataSource {
    
    // второй метод нам говорит: сколько ячеек должно быть в одной секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goodsArray.count
    }
    
    // этот метод нам говорит, что у нас должно содержаться в ячейке
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // dequeueReusableCell - ячейка переиспользуется
        let cell = tableView.dequeueReusableCell(withIdentifier: "GoodsTableViewCell", for: indexPath) as! GoodsTableViewCell
        let goods = goodsArray[indexPath.row]
        cell.viewModel = goods
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.outputView.deleteButtonPressed(item: indexPath.row)
        }
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    
}


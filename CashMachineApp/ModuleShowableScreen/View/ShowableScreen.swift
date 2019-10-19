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
    
    private var purchases = [InformationCellViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        view.backgroundColor = .white
        setUpUI()
        tableView.reloadData()
        
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        print("init works")
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print(aDecoder)
        print(self.nibName as Any)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("awakeFormNib")
    }
}

extension ShowableScreen {
    
    private func setUpUI() {
        let nib = UINib(nibName: "ShowableItemTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ShowableItemTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
}
extension ShowableScreen {
    @IBAction func backward(_ sender: UIButton) {
        outputView.backToInteractive()
    }
}

extension ShowableScreen: ViewInputShowableScreen {
    func setDataOfItems(_ array: [InformationCellViewModel]) {
        purchases = array
    }
    
   
    var output: ViewOutputShowableScreen {
        get {
            return outputView
        }
        set {
            outputView = newValue
        }
    }
    
    func deleteIndexPath(row: Int) {
        purchases.remove(at: row)
        tableView.deleteRows(at: [IndexPath(row: row, section: 0)], with: .fade)
    }
    
}

extension ShowableScreen: UITableViewDataSource, UITableViewDelegate {
    
    // второй метод нам говорит: сколько ячеек должно быть в одной секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return purchases.count
    }
    
    // этот метод нам говорит, что у нас должно содержаться в ячейке
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // dequeueReusableCell - ячейка переиспользуется
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShowableItemTableViewCell", for: indexPath) as! ShowableItemTableViewCell
        let product = purchases[indexPath.row]
        cell.viewModel = product
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.outputView.deleteButtonPressed(item: indexPath.row)
        }
        
    }
    
    
}


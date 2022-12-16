//
//  CardViewController.swift
//  DeliFood
//
//  Created by Daniel Derek Arredondo Asto on 30/11/22.
//

import UIKit
import CoreData

protocol CardViewControllerProtocol {
    func reloadTable()
    func reloadPrice()
}

class CardViewController: UIViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    //var productsCar:[ProductCar] = []
    
    var presenter: CarPresenterProtocol?
    
    @IBOutlet weak var prodCardTable: UITableView!
    var PriceT:Int = 0
    @IBOutlet weak var totalPrice: UILabel!
    let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ProductsCar")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prodCardTable.dataSource = self
    }
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func Comprar(_ sender: Any) {
        // DElete data coredata
        presenter?.Comprar()
    }
}

extension CardViewController: CardViewControllerProtocol{
    func reloadPrice() {
        totalPrice.text = presenter?.getPriceTotal() ?? "0"
    }
    
    func reloadTable() {
        prodCardTable.reloadData()
    }
}

extension CardViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getProducts().count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return presenter?.printTable(tableView, indexPath) ?? UITableViewCell()
    }
    
}

//
//  CardViewController.swift
//  DeliFood
//
//  Created by Daniel Derek Arredondo Asto on 30/11/22.
//

import UIKit
import CoreData

class CardViewController: UIViewController, UITableViewDataSource {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var productsCar:[ProductCar] = []
    
    @IBOutlet weak var prodCardTable: UITableView!
    var PriceT:Int = 0
    @IBOutlet weak var totalPrice: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ProductsCar")
        let context = appDelegate.persistentContainer.viewContext
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request);
            for data in result as! [NSManagedObject] {
                let name = data.value(forKey: "name_product") as! String
                let count = data.value(forKey: "count") as! Int
                let id = data.value(forKey: "id_product") as! Int
                let description = data.value(forKey: "descripcion") as! String
                let imagen = data.value(forKey: "image_product") as! String
                let price = data.value(forKey: "price") as! Int
                PriceT += price
                let product = ProductCar(idProduct: id, nameProduct: name, count: count, descripcion: description, imagenProduct: imagen, priceProduct: price)
                productsCar.append(product)
            }
        } catch {
            print("Failed")
        }
        prodCardTable.dataSource = self
        totalPrice.text = String(PriceT)
    }
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productsCar.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = prodCardTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ProducTableViewCell {
            let product = productsCar[indexPath.row]
            cell.addDataCell(product)
            return cell
        }else {
            return UITableViewCell()
        }
    }
}

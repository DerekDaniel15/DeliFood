//
//  ProducTableViewCell.swift
//  DeliFood
//
//  Created by Daniel Derek Arredondo Asto on 5/12/22.
//

import UIKit
import CoreData

class ProducTableViewCell: UITableViewCell {
    
    var presenter: CarPresenterProtocol?

    @IBOutlet weak var nameProduc: UILabel!
    @IBOutlet weak var imageProduc: UIImageView!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var count: UILabel!
    @IBOutlet weak var unitPrice: UILabel!
    
    let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ProductsCar")
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var idPedido: Int!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func deletePedido(_ sender: Any) {
        presenter?.deleteProductCar(idPedido)
    }
    
    func addDataCell(_ product:ProductCar) {
        idPedido = product.idProduct
        imageProduc.loadFrom(URLAddress: String(product.imagenProduct))
        price.text = String(product.priceProduct)
        let unPrice = product.priceProduct / product.count
        unitPrice.text = "Precio x unid. S/." + String(unPrice)
        nameProduc.text = product.nameProduct
        count.text = "x" + String(product.count)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    

}

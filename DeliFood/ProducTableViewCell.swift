//
//  ProducTableViewCell.swift
//  DeliFood
//
//  Created by Daniel Derek Arredondo Asto on 5/12/22.
//

import UIKit

class ProducTableViewCell: UITableViewCell {

    @IBOutlet weak var nameProduc: UILabel!
    @IBOutlet weak var imageProduc: UIImageView!
    @IBOutlet weak var price: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func addDataCell(_ product:ProductCar) {
            print("celda--> ")
            imageProduc.loadFrom(URLAddress: String(product.imagenProduct))
            price.text = String(product.priceProduct)
            nameProduc.text = product.nameProduct
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

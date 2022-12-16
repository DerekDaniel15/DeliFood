//
//  CeldaTableViewCell.swift
//  DeliFood
//
//  Created by Daniel Derek Arredondo Asto on 29/11/22.
//

import UIKit

class CeldaCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var price: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func addDataCollection(_ product: Producto) {
        nameLabel.text = product.nameProduct
        image.loadFrom(URLAddress: String(product.imagenProduct))
        price.text = "S/." + String(product.priceProduct)
    }
    
    override func select(_ sender: Any?) {
        print("select")
    }
}

extension UIImageView {
    func loadFrom(URLAddress: String) {
        if let url = URL(string: URLAddress) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
              // Error handling...
              guard let imageData = data else { return }

              DispatchQueue.main.async {
                self.image = UIImage(data: imageData)
              }
            }.resume()
          }
    }
}

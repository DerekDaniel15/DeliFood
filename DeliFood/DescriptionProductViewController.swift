//
//  DescriptionProductViewController.swift
//  DeliFood
//
//  Created by Daniel Derek Arredondo Asto on 29/11/22.
//

import UIKit
import CoreData


class DescriptionProductViewController: UIViewController {
    var producto: Productos!

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var priceProduct: UILabel!
    @IBOutlet weak var productDescription: UITextView!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productName.text = producto.nameProduct
        productImage.loadFrom(URLAddress: producto.imagenProduct)
        productDescription.text = producto.descripcion
        priceProduct.text = String(producto.priceProduct)
        // Do any additional setup after loading the view.
    }

    @IBAction func CardViewBtn(_ sender: Any) {
        if let cardView = storyboard?.instantiateViewController(withIdentifier: "CardViewController") as? CardViewController {
            cardView.modalPresentationStyle = .fullScreen
            show(cardView, sender: sender)
        }else {
            return
        }
    }
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func addCard(_ sender: Any) {
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "ProductsCar", in: context)
        let newProductCar = NSManagedObject(entity: entity!, insertInto: context)
        newProductCar.setValue(producto.idProduct, forKey: "id_product")
        newProductCar.setValue(1, forKey: "count")
        newProductCar.setValue(producto.priceProduct, forKey: "price")
        newProductCar.setValue(producto.descripcion, forKey: "descripcion")
        newProductCar.setValue(producto.imagenProduct, forKey: "image_product")
        newProductCar.setValue(producto.nameProduct, forKey: "name_product")
        do {
            try context.save()
        } catch {
            print("Error saving")
        }
    }
}

extension UIImageView {
    func loadFrom(URLAddress: String) {
        guard let url = URL(string: URLAddress) else {
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                    self?.image = loadedImage
                }
            }
        }
    }
}

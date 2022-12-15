//
//  DescriptionProductViewController.swift
//  DeliFood
//
//  Created by Daniel Derek Arredondo Asto on 29/11/22.
//

import UIKit
import CoreData

protocol DescriptionProductViewControllerProtocol {
    
}

class DescriptionProductViewController: UIViewController {
    var presenter: DescriptionPresenterProtocol?

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var priceProduct: UILabel!
    @IBOutlet weak var counter: UIStepper!
    @IBOutlet weak var productDescription: UITextView!
    @IBOutlet weak var Cantidad: UILabel!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Cantidad.text = "\(Int(counter.value))"
        productName.text = presenter?.getDataProduct().nameProduct
        productImage.loadFrom(URLAddress: String(presenter?.getDataProduct().imagenProduct ?? ""))
        productDescription.text = presenter?.getDataProduct().descripcion
        priceProduct.text = String(presenter?.getDataProduct().priceProduct ?? 0)
    }
    
    @IBAction func ClickCount(_ sender: Any) {
        Cantidad.text = "\(Int(counter.value))"
    }
    
    @IBAction func CardViewBtn(_ sender: Any) {
        presenter?.viewCar()
    }
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func addCard(_ sender: Any) {
        presenter?.addToCar(Int(counter.value))
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

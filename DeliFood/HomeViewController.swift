//
//  ViewController.swift
//  DeliFood
//
//  Created by Daniel Derek Arredondo Asto on 25/11/22.

import UIKit

class HomeViewController: UIViewController {
    
    let products: [Productos] = [
        Productos(idProduct: 1, nameProduct: "Pastel de manzana", stock: 12, categoryProduct: "Postre", descripcion: "Pastel de manzana chilenas cubierta con chantilli y crema con decoracion de caracol y bastones de chocolate",imagenProduct: "https://www.hogarmania.com/archivos/201402/5317-2-tarta-de-manzana-702-xl-668x400x80xX.jpg",priceProduct: 230),
        Productos(idProduct: 2, nameProduct: "Chicha morada", stock: 12, categoryProduct: "Bebidas", descripcion: "Pastel de manzana chilenas cubierta con chantilli y crema con decoracion de caracol y bastones de chocolate", imagenProduct: "https://www.peru.travel/Contenido/General/Imagen/pe/650/1.1/chicha-morada-limon.jpg",priceProduct: 120)
    ]
    var filterProducts:[Productos] = []

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filterProducts = products
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }

    @IBAction func viewCardBtn(_ sender: Any) {
        if let cardView = storyboard?.instantiateViewController(withIdentifier: "CardViewController") as? CardViewController {
            cardView.modalPresentationStyle = .fullScreen
            show(cardView, sender: sender)
        }else {
            return
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as? CeldaTableViewCell {
            let product = filterProducts[indexPath.row]
            cell.nameLabel.text = product.nameProduct
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar == searchBar {
            if searchText != "" {
                filterProducts = products.filter({$0.nameProduct.lowercased().contains(searchText.lowercased())})
                tableView.reloadData()
            }else{
                self.filterProducts = products
                tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = filterProducts[indexPath.row]
        print(product)
        guard let secondViewController = storyboard?.instantiateViewController(withIdentifier: "DescriptionProductViewController") as? DescriptionProductViewController else {
            return
        }
        secondViewController.producto = product
        secondViewController.modalPresentationStyle = .fullScreen   // no se puede regresar usar navigate
        present(secondViewController, animated: true)
        //show(secondViewController, sender: Any)
        
    }
}


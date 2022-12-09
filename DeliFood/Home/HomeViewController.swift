//
//  ViewController.swift
//  DeliFood
//
//  Created by Daniel Derek Arredondo Asto on 25/11/22.

import UIKit

class HomeViewController: UIViewController {
    
    var products: [Producto] = []
    var filterProducts:[Producto] = []

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        readJSONFromFile(fileName: "test")
    }
    
    func readJSONFromFile (fileName: String) {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(Productos.self, from: data)
                products = jsonData.product
                filterProducts = products
                tableView.reloadData()
            } catch {
                print("error:\(error)")
            }
        }
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
    }
}


//
//  ViewController.swift
//  DeliFood
//
//  Created by Daniel Derek Arredondo Asto on 25/11/22.

import UIKit

class HomeViewController: UIViewController {
    
    let products = ["Manzana", "Pera", "Zandia", "Mango"]
    var filterProducts:[String] = []

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filterProducts = products
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as? CeldaTableViewCell {
            let product = filterProducts[indexPath.row]
            cell.nameLabel.text = product
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != "" {
            filterProducts = products.filter({$0.contains(searchText)})
            tableView.reloadData()
        }else{
            self.filterProducts = products
            tableView.reloadData()
            
        }
        print(filterProducts)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = filterProducts[indexPath.row]
        print(product)
        guard let secondViewController = storyboard?.instantiateViewController(withIdentifier: "DescriptionProductViewController") as? DescriptionProductViewController else {
            return
        }
        secondViewController.name = product
        //secondViewController.modalPresentationStyle = .fullScreen   // no se puede regresar usar navigate
        present(secondViewController, animated: true)
        
    }
}


//
//  ViewController.swift
//  DeliFood
//
//  Created by Daniel Derek Arredondo Asto on 25/11/22.

import UIKit

protocol HomeViewControllerProtocol: AnyObject {
    
}

class HomeViewController: UIViewController,  HomeViewControllerProtocol {
    
    var presenter: HomePresenterProtocol?

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionProduct: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionProduct.dataSource = self
        collectionProduct.delegate = self
        presenter?.getData()
    }
    
    // PASAR VIPER
    @IBAction func viewCardBtn(_ sender: Any) {
        presenter?.viewCar()
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.getNumberofItem() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return presenter?.printProductData(collectionView, indexPath) ?? UICollectionViewCell()
    }
    
    
    //PASAR VIPER
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.viewDetailProduct(indexPath.row)
    }
}


extension HomeViewController: UISearchBarDelegate {
    // PASAR VIPER
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar == searchBar { presenter?.SearchProduct(searchText)
            collectionProduct.reloadData()
        }
    }
}


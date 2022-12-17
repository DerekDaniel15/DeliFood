//
//  HomePresenter.swift
//  DeliFood
//
//  Created by Daniel Derek Arredondo Asto on 12/12/22.
//

import Foundation
import UIKit

protocol HomePresenterProtocol: AnyObject {
    func getData()
    func SearchProduct(_ text: String)
    func printProductData(_ collectionView: UICollectionView, _ indexPath: IndexPath) -> UICollectionViewCell
    func getNumberofItem() -> Int
    
    func viewDetailProduct(_ index: Int)
    func viewCar()
}

class HomePresenter {
    var view: HomeViewControllerProtocol?
    var interactor: HomeInteractorProtocol?
    var router: HomeRouterProtocol?
    
    var products:[Producto] = []
    var filterProduct:[Producto] = []
    var codigo: [Int] = []
    
}

extension HomePresenter: HomePresenterProtocol {
    
    func viewCar() {
        router?.presentCarView()
    }
    
    func viewDetailProduct(_ index: Int) {
        let product = filterProduct[index]
        router?.presentDescriptionView(product)
    }
    
    func getNumberofItem() -> Int {
        return filterProduct.count
    }
    
    func printProductData(_ collectionView: UICollectionView, _ indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            as? CeldaCollectionViewCell {
            let product = filterProduct[indexPath.row]
            cell.addDataCollection(product)
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func SearchProduct(_ text: String) {
        if text != "" {
            filterProduct = products.filter({$0.nameProduct.lowercased().contains(text.lowercased())})
        }else{
            filterProduct = products
        }
    }
    
    func getData() {
        products = interactor?.GetdataByJson() ?? []
        filterProduct = products
    }
}


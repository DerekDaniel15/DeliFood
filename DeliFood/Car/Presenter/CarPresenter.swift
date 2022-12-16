//
//  CarPresenter.swift
//  DeliFood
//
//  Created by Daniel Derek Arredondo Asto on 14/12/22.
//

import Foundation
import UIKit

protocol CarPresenterProtocol {
    func getProducts() -> [ProductCar]
    func printTable(_ tableView: UITableView,_ indexPath: IndexPath) -> UITableViewCell
    
    func getPriceTotal() -> String
    
    func deleteProductCar(_ id: Int)
    
    func Comprar()
}

class CarPresenter {
    var router: CarRouterProtocol?
    var interactor: CarInteractorProtocol?
    var view: CardViewControllerProtocol?
    
    var products: [ProductCar] = []
    var priceTotal: Int = 0
    
}

extension CarPresenter: CarPresenterProtocol {
    func Comprar() {
        //interactor?.comprar()
        router?.viewPago()
    }
    
    func deleteProductCar(_ id: Int) {
        print("--------------->delete"+String(id))
        interactor?.deleteProductCar(id)
        products = products.filter{ p in
            p.idProduct != id
        }
        view?.reloadTable()
        view?.reloadPrice()
    }
    
    func printTable(_ tableView: UITableView,_ indexPath: IndexPath) -> UITableViewCell {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ProducTableViewCell {
                let product = products[indexPath.row]
                cell.addDataCell(product)
                cell.presenter = self
                return cell
            }else {
                return UITableViewCell()
            }
    }
    
    func getPriceTotal() -> String {
        priceTotal = 0
        products.forEach { p in
            priceTotal += p.priceProduct
        }
        print(priceTotal)
        return String(priceTotal)
    }
    
    func getProducts() -> [ProductCar] {
        if products.isEmpty {
            products = interactor?.getProductsCar() ?? []
        }
        view?.reloadPrice()
        return products
    }
    
    
}

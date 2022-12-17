//
//  DescriptionPresenter.swift
//  DeliFood
//
//  Created by Daniel Derek Arredondo Asto on 13/12/22.
//

import Foundation
import UIKit
import CoreData

protocol DescriptionPresenterProtocol: AnyObject {
    func addToCar(_ Count:Int)
    func getDataProduct() -> ProductDetailProtocol
    func viewCar()
    func getTotalPrice(_ count:Int) -> String
}

class DescriptionPresenter {
    var view: UIViewController!
    var router: DescriptionRouterProtocol?
    var interactor: DescriptionInteractorProtocol?
    var producto: ProductDetailProtocol!
    
}

extension DescriptionPresenter: DescriptionPresenterProtocol {
    func getTotalPrice(_ count:Int) -> String {
        let price = producto.priceProduct
        return String( price * count)
    }
    
    func viewCar() {
        router?.viewCar()
    }
    
    
    func getDataProduct() -> ProductDetailProtocol {
        return producto
    }
    
    func addToCar(_ Count:Int) {
        interactor?.setProductDatacore(producto, Count)
    }
}

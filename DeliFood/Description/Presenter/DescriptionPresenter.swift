//
//  DescriptionPresenter.swift
//  DeliFood
//
//  Created by Daniel Derek Arredondo Asto on 13/12/22.
//

import Foundation
import UIKit
import CoreData

protocol DescriptionPresenterProtocol {
    func addToCar(_ Count:Int)
    func getDataProduct() -> ProductDetailProtocol
    func viewCar()
}

class DescriptionPresenter {
    var view: UIViewController!
    var router: DescriptionRouterProtocol?
    var interactor: DescriptionInteractorProtocol?
    var producto: ProductDetailProtocol!
}

extension DescriptionPresenter: DescriptionPresenterProtocol {
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

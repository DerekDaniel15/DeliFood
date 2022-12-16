//
//  CarInteractor.swift
//  DeliFood
//
//  Created by Daniel Derek Arredondo Asto on 14/12/22.
//

import Foundation


protocol CarInteractorProtocol {
    func getProductsCar() -> [ProductCar]
    func deleteProductCar(_ id:Int)
    func comprar()
}

class CarInteractor {
    var presenter: CarPresenterProtocol?
    var api: DataCacheCore?
}

extension CarInteractor: CarInteractorProtocol {
    func comprar() {
        api?.deleteAllProduct()
    }
    
    func deleteProductCar(_ id:Int) {
        api?.deleteProduct(id)
    }
    
    func getProductsCar() -> [ProductCar] {
        return api?.getproductsCar() ?? []
    }
    
}

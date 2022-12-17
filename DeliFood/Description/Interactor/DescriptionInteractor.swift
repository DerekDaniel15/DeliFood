//
//  DescriptionInteractor.swift
//  DeliFood
//
//  Created by Daniel Derek Arredondo Asto on 13/12/22.
//

import Foundation

protocol DescriptionInteractorProtocol:AnyObject {
    func setProductDatacore(_ producto: ProductDetailProtocol, _ Count:Int)
}

class DescriptionInteractor {
    var api: DataCacheCore?
    var presenter: DescriptionPresenterProtocol?
}

extension DescriptionInteractor: DescriptionInteractorProtocol {
    
    func setProductDatacore(_ producto: ProductDetailProtocol, _ Count:Int) {
        api?.updateProductCar(producto, Count)
    }
}

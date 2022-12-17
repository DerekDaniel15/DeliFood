//
//  HomeInteractor.swift
//  DeliFood
//
//  Created by Daniel Derek Arredondo Asto on 12/12/22.
//

import Foundation

protocol HomeInteractorProtocol: AnyObject {
    func GetdataByJson() -> [Producto]
}

class HomeInteractor {
    var presenter: HomePresenterProtocol?
    var api: DataRemote?
    var coredata: DataCacheCore?
}

extension HomeInteractor: HomeInteractorProtocol {
    
    func GetdataByJson() -> [Producto] {
        return api?.getproducts() ?? []
    }
    
}

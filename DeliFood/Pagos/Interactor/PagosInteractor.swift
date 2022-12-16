//
//  PagosInteractor.swift
//  DeliFood
//
//  Created by Daniel Derek Arredondo Asto on 16/12/22.
//

import Foundation

protocol PagosInteractorProtocol {
    
}

class PagosInteractor {
    var presenter: PagosPresenterProtocol?
    var coredata: DataCacheCore?
}

extension PagosInteractor: PagosInteractorProtocol {
    
}

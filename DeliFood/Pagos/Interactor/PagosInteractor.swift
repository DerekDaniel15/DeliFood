//
//  PagosInteractor.swift
//  DeliFood
//
//  Created by Daniel Derek Arredondo Asto on 16/12/22.
//

import Foundation

protocol PagosInteractorProtocol {
    func getCodePago() -> Int
    func getCodeCache() -> Int
    
    func setCodeCahe(_ code:Int)
    func deleteCode()
}

class PagosInteractor {
    var presenter: PagosPresenterProtocol?
    var coredata: DataCacheCore?
    var api: DataRemote?
}

extension PagosInteractor: PagosInteractorProtocol {
    
    func deleteCode() {
        coredata?.deleteCode()
    }
    
    func setCodeCahe(_ code: Int) {
        coredata?.setCode(code)
    }
    
    func getCodeCache() -> Int {
        return coredata?.getCode() ?? 0
    }
    
    func getCodePago() ->Int {
        return api?.getCodigo() ?? 0
    }
}

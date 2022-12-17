//
//  PagosPresenter.swift
//  DeliFood
//
//  Created by Daniel Derek Arredondo Asto on 16/12/22.
//

import Foundation

protocol PagosPresenterProtocol {
    func getCodePagoApi()
    func getCodigo() -> Int
    func deleteCodigo()
    
}

class PagosPresenter {
    var view: PagosViewControllerProtocol?
    var interactor: PagosInteractorProtocol?
    var router: PagosRouterProtocol?
    
    var codigo:Int = 0
}

extension PagosPresenter: PagosPresenterProtocol {
    
    func deleteCodigo() {
        interactor?.deleteCode()
    }
    
    func getCodigo() -> Int {
        let code = interactor?.getCodeCache() ?? 0
        if code != 0 {
            return code
        }else {
            getCodePagoApi()
            return codigo
        }
    }
    
    func getCodePagoApi() {
        if let code = interactor?.getCodePago() {
            codigo = code
            interactor?.setCodeCahe(code)
        }else {
            return
        }
    }
}

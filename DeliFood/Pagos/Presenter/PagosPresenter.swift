//
//  PagosPresenter.swift
//  DeliFood
//
//  Created by Daniel Derek Arredondo Asto on 16/12/22.
//

import Foundation

protocol PagosPresenterProtocol {
    func getCodePago()
}

class PagosPresenter {
    var view: PagosViewControllerProtocol?
    var interactor: PagosInteractorProtocol?
    var router: PagosRouterProtocol?
}

extension PagosPresenter: PagosPresenterProtocol {
    func getCodePago() {
        
    }
}

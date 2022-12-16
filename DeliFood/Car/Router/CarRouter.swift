//
//  CarRouter.swift
//  DeliFood
//
//  Created by Daniel Derek Arredondo Asto on 14/12/22.
//

import Foundation
import UIKit

protocol CarRouterProtocol {
    func viewPago()
}

class CarRouter {
    var presenter: CarPresenterProtocol?
    var view: UIViewController?
    
    required init(presenter: CarPresenterProtocol) {
        self.presenter = presenter
    }
}

extension CarRouter: CarRouterProtocol {
    func viewPago() {
        let viewPago = PagosConfigure.makeViewPagos()
        viewPago.modalPresentationStyle = .fullScreen
        view?.present(viewPago, animated: true)
    }
    
    
}

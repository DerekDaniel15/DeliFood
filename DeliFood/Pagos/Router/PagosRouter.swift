//
//  Pagos.swift
//  DeliFood
//
//  Created by Daniel Derek Arredondo Asto on 16/12/22.
//

import Foundation
import UIKit

protocol PagosRouterProtocol {
    
}

class PagosRouter {
    
    var view: UIViewController?
    var presenter: PagosPresenterProtocol?
    
    required init(presenter: PagosPresenterProtocol) {
        self.presenter = presenter
    }
}

extension PagosRouter: PagosRouterProtocol {
    
}

//
//  CarRouter.swift
//  DeliFood
//
//  Created by Daniel Derek Arredondo Asto on 14/12/22.
//

import Foundation
import UIKit

protocol CarRouterProtocol {
    
}

class CarRouter: CarRouterProtocol {
    var presenter: CarPresenterProtocol?
    var view: UIViewController?
    
    required init(presenter: CarPresenterProtocol) {
        self.presenter = presenter
    }
}

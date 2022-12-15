//
//  DescriptionRouter.swift
//  DeliFood
//
//  Created by Daniel Derek Arredondo Asto on 13/12/22.
//

import Foundation
import UIKit

protocol DescriptionRouterProtocol {
    func viewCar()
}

class DescriptionRouter {
    var presenter : DescriptionPresenterProtocol?
    var view: UIViewController?
    
    required init(presenter: DescriptionPresenterProtocol) {
        self.presenter = presenter
    }
}

extension DescriptionRouter: DescriptionRouterProtocol {
    func viewCar() {
        let viewCar = CarConfig.makeViewCar()
        viewCar.modalPresentationStyle = .fullScreen
        view?.present(viewCar, animated: true)
    }
    
    
}

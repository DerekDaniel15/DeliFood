//
//  CarConfiguration.swift
//  DeliFood
//
//  Created by Daniel Derek Arredondo Asto on 14/12/22.
//

import Foundation
import UIKit

class CarConfig {
    static func makeViewCar() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let api = CoreDataService()
        
        let presenter = CarPresenter()
        let interactor = CarInteractor()
        let router = CarRouter(presenter: presenter)
        
        let view = storyboard.instantiateViewController(withIdentifier: "CardViewController") as! CardViewController
        
        interactor.api = api
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        router.view = view
        
        view.presenter = presenter
        
        return view
    }
}

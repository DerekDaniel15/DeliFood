//
//  HomeConfigurate.swift
//  DeliFood
//
//  Created by Daniel Derek Arredondo Asto on 12/12/22.
//

import Foundation
import UIKit

class HomeConfigurate {
    
    static func makeHome () -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let api = MocksService()
        let presenter = HomePresenter()
        let interactor = HomeInteractor()
        let view = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        let router = HomeRouter(presenter: presenter)
        router.view = view
        
        interactor.api = api
        
        presenter.router = router
        presenter.interactor = interactor
        presenter.view = view
        presenter.products = []
        
        view.presenter = presenter
        
        return view
    }
    
}

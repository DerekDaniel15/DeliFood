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
        
        let coredata = CoreDataService()
        let api = MocksService()
        let interactor = HomeInteractor()
        let view = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        let presenter = HomePresenter()
        let router = HomeRouter(presenter: presenter)
        router.view = view
        
        interactor.api = api
        interactor.coredata = coredata
        
        presenter.router = router
        presenter.view = view
        presenter.products = []
        presenter.interactor = interactor
        
        view.presenter = presenter
        
        return view
    }
    
}

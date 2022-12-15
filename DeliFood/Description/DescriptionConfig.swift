//
//  DescriptionConfig.swift
//  DeliFood
//
//  Created by Daniel Derek Arredondo Asto on 12/12/22.
//

import Foundation
import UIKit

class DescriptionConfig {
    static func makeDescription(_ product: ProductDetailProtocol) -> UIViewController{
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let api = CoreDataService()
        
        let presenter = DescriptionPresenter()
        let interactor = DescriptionInteractor()
        let router = DescriptionRouter(presenter: presenter)
        
        let view = storyboard.instantiateViewController(withIdentifier: "DescriptionProductViewController") as! DescriptionProductViewController
        
        interactor.api = api
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        presenter.producto = product
        
        router.view = view
        
        view.presenter = presenter
        
        return view
    }
}

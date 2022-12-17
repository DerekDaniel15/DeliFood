//
//  PagosConfigure.swift
//  DeliFood
//
//  Created by Daniel Derek Arredondo Asto on 16/12/22.
//

import Foundation
import UIKit

class PagosConfigure {
    static func makeViewPagos() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let coredata = CoreDataService()
        let api = MocksService()
        let presenter = PagosPresenter()
        let interactor = PagosInteractor()
        let view = storyboard.instantiateViewController(withIdentifier: "PagosViewController") as! PagosViewController
        let router = PagosRouter(presenter: presenter)
        router.view = view
        
        interactor.coredata = coredata
        interactor.api = api
        
        presenter.router = router
        presenter.interactor = interactor
        presenter.view = view
        
        view.presenter = presenter
        
        return view
    }
}

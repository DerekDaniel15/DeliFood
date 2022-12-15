//
//  HomeRouter.swift
//  DeliFood
//
//  Created by Daniel Derek Arredondo Asto on 12/12/22.
//

import Foundation
import UIKit

protocol HomeRouterProtocol {
    func presentDescriptionView(_ product: Producto)
    func presentCarView()
} 

class HomeRouter {
    var presenter: HomePresenterProtocol?
    var view: UIViewController?
    
    required init(presenter: HomePresenterProtocol) {
        self.presenter = presenter
    }
}

extension HomeRouter: HomeRouterProtocol{
    func presentCarView() {
        let viewCar = CarConfig.makeViewCar()
        viewCar.modalPresentationStyle = .fullScreen
        view?.present(viewCar, animated: true)
    }
    
    func presentDescriptionView(_ product: Producto){
        let productDetail = ProductDetail(idProduct: product.idProduct, nameProduct: product.nameProduct, stock: product.stock, categoryProduct: product.categoryProduct, descripcion: product.descripcion, imagenProduct: product.imagenProduct, priceProduct: product.priceProduct)
        let viewDescription = DescriptionConfig.makeDescription(productDetail)
        viewDescription.modalPresentationStyle = .fullScreen
        view?.present(viewDescription, animated: true)
    }
}

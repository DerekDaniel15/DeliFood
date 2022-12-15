//
//  ProductDetail.swift
//  DeliFood
//
//  Created by Daniel Derek Arredondo Asto on 12/12/22.
//

import Foundation

class ProductDetail: ProductDetailProtocol {
    let idProduct: Int
    let nameProduct: String
    let stock: Int
    let categoryProduct: String
    let descripcion: String
    let imagenProduct: String
    let priceProduct: Int
    
    required init(idProduct:Int, nameProduct: String, stock: Int, categoryProduct: String, descripcion: String, imagenProduct: String, priceProduct: Int) {
        self.idProduct = idProduct
        self.nameProduct = nameProduct
        self.stock = stock
        self.categoryProduct = categoryProduct
        self.descripcion = descripcion
        self.imagenProduct = imagenProduct
        self.priceProduct = priceProduct
    }
    
}

//
//  Productos.swift
//  DeliFood
//
//  Created by Daniel Derek Arredondo Asto on 4/12/22.
//

import Foundation

struct Producto: Codable {
    let idProduct: Int
    let nameProduct: String
    let stock: Int
    let categoryProduct, descripcion, imagenProduct: String
    let priceProduct: Int
}

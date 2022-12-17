//
//  ProtocolProductDetail.swift
//  DeliFood
//
//  Created by Daniel Derek Arredondo Asto on 13/12/22.
//

import Foundation

public protocol ProductDetailProtocol: AnyObject {
    var idProduct: Int { get }
    var nameProduct: String { get }
    var stock: Int { get }
    var categoryProduct: String { get }
    var descripcion: String { get }
    var imagenProduct: String { get }
    var priceProduct: Int { get }
}

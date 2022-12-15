//
//  NetworkService.swift
//  DeliFood
//
//  Created by Daniel Derek Arredondo Asto on 12/12/22.
//

import Foundation

protocol DataRemote {
    func getproducts() -> [Producto]
}

class NetworkService: DataRemote {
    func getproducts() -> [Producto] {
        return []
    }
}

class MocksService: DataRemote {
    func getproducts() -> [Producto] {
        if let url = Bundle.main.url(forResource: "test", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(Productos.self, from: data)
                return jsonData.product
            } catch {
                print("error:\(error)")
            }
        }
        return []
    }
}

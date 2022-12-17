//
//  NetworkService.swift
//  DeliFood
//
//  Created by Daniel Derek Arredondo Asto on 12/12/22.
//

import Foundation

protocol DataRemote: AnyObject {
    func getproducts() -> [Producto]
    func getCodigo() -> Int
}

class NetworkService: DataRemote {
    func getCodigo() -> Int {
        return 0
    }
    
    func getproducts() -> [Producto] {
        return []
    }
}

class MocksService: DataRemote {
    func getCodigo() -> Int {
        let randomInt = Int.random(in: 99999..<1000000)
        print(randomInt)
        return randomInt
    }
    
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

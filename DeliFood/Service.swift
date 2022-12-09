//
//  Service.swift
//  DeliFood
//
//  Created by Daniel Derek Arredondo Asto on 8/12/22.
//

import Foundation
//import SwiftyJSON

class FirstService {

    static let sharedInstance : FirstService = {
       //Do any computations needed to have the args for SomeService initializer, if not you can omit this closure and directly assign SomeService() to sharedInstance
       return FirstService() //<--Call the designated initialiser to instantiate the object.
    }()
    
    func loadJson(fileName: String) -> Productos? {
       let decoder = JSONDecoder()
       guard
            let url = Bundle.main.url(forResource: fileName, withExtension: "json"),
            let data = try? Data(contentsOf: url),
            let product = try? decoder.decode(Productos.self, from: data)
       else {
            return nil
       }

       return product
    }
    
    func GetJson() {
        if let path = Bundle.main.path(forResource: "assets/test", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                //let jsonObj = try JSON(data: data)
                let jsonObj = " "
                print("jsonData:\(jsonObj)")
            } catch let error {
                print("parse error: \(error.localizedDescription)")
            }
        } else {
            print("Invalid filename/path.")
        }
    }

    //Other methods of the class....
}

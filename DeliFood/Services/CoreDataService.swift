//
//  CoreDataService.swift
//  DeliFood
//
//  Created by Daniel Derek Arredondo Asto on 12/12/22.
//

import Foundation
import CoreData
import UIKit


protocol DataCacheCore: AnyObject {
    func getproductsCar() -> [ProductCar]
    func updateProductCar(_ producto: ProductDetailProtocol, _ Count:Int)
    func setProductCar(_ producto: ProductDetailProtocol, _ Count:Int)
    func deleteProduct(_ id:Int)
    func deleteAllProduct()
    
    func setCode(_ codigo:Int)
    func getCode() -> Int
    func deleteCode()
}

class CoreDataService: DataCacheCore {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    let requestProductCar = NSFetchRequest<NSFetchRequestResult>(entityName: "ProductsCar")
    let requestCodigoPago = NSFetchRequest<NSFetchRequestResult>(entityName: "CodigoPago")
    
    func setCode(_ codigo:Int) {
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "CodigoPago", in: context)
        let newProductCar = NSManagedObject(entity: entity!, insertInto: context)
        newProductCar.setValue(codigo, forKey: "codigo")
        do {
            try context.save()
        } catch {
            print("Error saving")
        }
    }
    
    func getCode() -> Int {
        let context = appDelegate.persistentContainer.viewContext
        requestCodigoPago.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(requestCodigoPago);
            let data = result as! [NSManagedObject]
            if data.count != 0 {
                let code = data[0].value(forKey: "codigo") as! Int
                return code
            }
        } catch {
            print("Failed")
        }
        return 0
    }
    
    func deleteCode() {
        let context = appDelegate.persistentContainer.viewContext
        requestCodigoPago.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(requestCodigoPago);
            for data in result as! [NSManagedObject] {
                context.delete(data)
            }
        } catch {
            print("Failed")
        }
    }
    
    
    
    func deleteAllProduct() {
        let context = appDelegate.persistentContainer.viewContext
        requestProductCar.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(requestProductCar);
            for data in result as! [NSManagedObject] {
                context.delete(data)
            }
        } catch {
            print("Failed")
        }
    }
    
    func deleteProduct(_ id: Int) {
        let context = appDelegate.persistentContainer.viewContext
        requestProductCar.returnsObjectsAsFaults = false
        let predicate = NSPredicate(format: "(id_product = %@)", String(id) )
        requestProductCar.predicate = predicate
        do {
            let result = try context.fetch(requestProductCar);
            let data = result[0] as! NSManagedObject
            context.delete(data)
        } catch {
            print("Failed")
        }
    }
    
    func updateProductCar(_ producto: ProductDetailProtocol, _ Count:Int) {
        let context = appDelegate.persistentContainer.viewContext
        let predicate = NSPredicate(format: "(id_product = %@)", String(producto.idProduct) )
        requestProductCar.returnsObjectsAsFaults = false
        requestProductCar.predicate = predicate
        do {
            let results = try context.fetch(requestProductCar);
            if results.count != 0 {
                let objectUpdate = results[0] as! NSManagedObject
                let count = objectUpdate.value(forKey: "count") as! Int
                let countTotal = count + Count
                objectUpdate.setValue(countTotal, forKey: "count")
                objectUpdate.setValue(countTotal * producto.priceProduct, forKey: "price")
                do {
                    try context.save()
                } catch let error as NSError {
                    print(error)
                }
            }else {
                setProductCar(producto, Count)
            }
        } catch let error as NSError {
            print(error)
        }
    }
    
    func setProductCar(_ producto: ProductDetailProtocol, _ Count:Int) {
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "ProductsCar", in: context)
        let newProductCar = NSManagedObject(entity: entity!, insertInto: context)
        newProductCar.setValue(producto.idProduct, forKey: "id_product")
        newProductCar.setValue(Count, forKey: "count")
        newProductCar.setValue(producto.priceProduct * Count, forKey: "price")
        newProductCar.setValue(producto.descripcion, forKey: "descripcion")
        newProductCar.setValue(producto.imagenProduct, forKey: "image_product")
        newProductCar.setValue(producto.nameProduct, forKey: "name_product")
        do {
            try context.save()
            //counter.value = 1
            //Cantidad.text = "1"
        } catch {
            print("Error saving")
        }
    }
    
    func getproductsCar() -> [ProductCar] {
        var products: [ProductCar] = []
        let context = appDelegate.persistentContainer.viewContext
        requestProductCar.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(requestProductCar);
            for data in result as! [NSManagedObject] {
                let name = data.value(forKey: "name_product") as! String
                let count = data.value(forKey: "count") as! Int
                let id = data.value(forKey: "id_product") as! Int
                let description = data.value(forKey: "descripcion") as! String
                let imagen = data.value(forKey: "image_product") as! String
                let price = data.value(forKey: "price") as! Int
                //PriceT += price // usar viper
                let product = ProductCar(idProduct: id, nameProduct: name, count: count, descripcion: description, imagenProduct: imagen, priceProduct: price)
                products.append(product)
            }
            return products
        } catch {
            print("Failed")
        }
        return []
    }
}

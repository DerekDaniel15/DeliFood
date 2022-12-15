//
//  CoreDataService.swift
//  DeliFood
//
//  Created by Daniel Derek Arredondo Asto on 12/12/22.
//

import Foundation
import CoreData
import UIKit


protocol DataCacheCore {
    func getproductsCar() -> [ProductCar]
    func updateProductCar(_ producto: ProductDetailProtocol, _ Count:Int)
    func setProductCar(_ producto: ProductDetailProtocol, _ Count:Int)
    func deleteProduct(_ id:Int)
}

class CoreDataService: DataCacheCore {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ProductsCar")
    
    func deleteProduct(_ id: Int) {
        let context = appDelegate.persistentContainer.viewContext
        request.returnsObjectsAsFaults = false
        let predicate = NSPredicate(format: "(id_product = %@)", String(id) )
        request.predicate = predicate
        do {
            let result = try context.fetch(request);
            let data = result[0] as! NSManagedObject
            context.delete(data)
        } catch {
            print("Failed")
        }
    }
    
    func updateProductCar(_ producto: ProductDetailProtocol, _ Count:Int) {
        let context = appDelegate.persistentContainer.viewContext
        let predicate = NSPredicate(format: "(id_product = %@)", String(producto.idProduct) )
        request.returnsObjectsAsFaults = false
        request.predicate = predicate
        do {
            let results = try context.fetch(request);
            if results.count != 0 {
                let objectUpdate = results[0] as! NSManagedObject
                let count = objectUpdate.value(forKey: "count") as! Int
                let countTotal = count + Count
                objectUpdate.setValue(countTotal, forKey: "count")
                objectUpdate.setValue(countTotal * producto.priceProduct, forKey: "price")
                do {
                    try context.save()
                    print("update")
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
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request);
            print(result as! [NSManagedObject] )
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

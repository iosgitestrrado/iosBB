//
//  CoreDataManager.swift
//  bigbasket
//
//  Created by Deepu S on 25/09/22.
//

import Foundation

import CoreData

class CoreDataManager {
    let persistentContainer : NSPersistentContainer
    init(){
        persistentContainer = NSPersistentContainer(name: "CartDb")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("#Core data store failed init \(error.localizedDescription)")
            }
        }
    }
    
    func MoviUpdate (cartItem:CartItems){
        
        do {
            try persistentContainer.viewContext.save()
            print("#Save Data Item")
        }catch{
            print("#Error Save Data Item")
        }
        
    }
    
    func deleteMovie(cartItem:CartItems) {
        persistentContainer.viewContext.delete(cartItem)
        do{
            try persistentContainer.viewContext.save()
        }catch{
            persistentContainer.viewContext.rollback()
            print("#Error Save Data Item")
        }
    }
    
    func getAllCartItems () -> [CartItems] {
        let fetchRequest:NSFetchRequest<CartItems> = CartItems.fetchRequest()
        do{
            return try persistentContainer.viewContext.fetch(fetchRequest)
        }catch{
            return[]
        }
    }
    
    func saveCart (item:String,itemId:Int,qty:Double,amount:Double,total:Double,imgUrl:String) {
        let cart = CartItems(context: persistentContainer.viewContext)
        cart.item = item
        cart.itemId = Int64(itemId)
        cart.amount = amount
        cart.qty = qty
        cart.total = total
        cart.imgUrl = imgUrl
        
        do {
            try persistentContainer.viewContext.save()
            print("#Save Data Mave")
        }catch{
            print("#Error Save Data Mave")
        }
    }
    
    func updateCat(ItemId:Int,qty:Double,totalAmount:Double){
        let request:NSFetchRequest<CartItems> = CartItems.fetchRequest()
        request.predicate = NSPredicate(format: "itemId = %@", "\(ItemId)")
        
        do{
            let data = try persistentContainer.viewContext.fetch(request)
                data[0].qty = qty
                 data[0].total = totalAmount
            try persistentContainer.viewContext.save()
            print("#update Data \(data)")
        }catch{
            print("#Error update")
        }
    }


    
    func isItemInCat(ItemId:Int)->Bool {
        let request:NSFetchRequest<CartItems> = CartItems.fetchRequest()
        request.predicate = NSPredicate(format: "itemId = %@", "\(ItemId)")
        
        do{
            let data = try persistentContainer.viewContext.fetch(request)
            return data.isEmpty ? true:false
        }catch{
            return false
        }
    }
}

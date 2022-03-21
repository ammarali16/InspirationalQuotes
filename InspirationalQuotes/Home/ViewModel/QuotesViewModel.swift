//
//  QuotesViewModel.swift
//  InspirationalQuotes
//
//  Created by Admin on 11/27/18.
//  Copyright © 2018 Mujadidia Inc. All rights reserved.
//

import Foundation
import CoreData
import UIKit
import SwiftyJSON

class QuotesViewModel {
    
    //var viewModel = QuotesViewModel()
    var quoteArray = [QuotesModel]()
    
//    func getJsonData() -> [QuotesModel] {
//
//        if !AppDefaults.isAppStartingFirstTime {
//
//            let fileName = "quotes"
//
//            let path = Bundle.main.path(forResource: fileName, ofType: "json")!
//
//            let decoder = JSONDecoder()
//
//            do {
//
//                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
//                let jsonResponse = JSON(data)
//
//                let question = try jsonResponse.rawData()
//                let quotes = try decoder.decode([QuotesModel].self, from: question)
//
//                for item in quotes {
//                    _ = self.saveQuestion(item: item)
//                }
//
//                AppDefaults.isAppStartingFirstTime = true
//
//            }
//            catch(let error){
//                print("error: \(error.localizedDescription)")
//            }
//        }
//
//        return self.fetchAllQuotesFromCoreData()
//
//    }
    
    
//    func getJsonData(){
//
//
//
//        if !AppDefaults.isAppStartingFirstTime{
//
//            let fileName = "quotes"
//
//            if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
//
//                do {
//                    let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
//                    let jsonResponse = JSON(data)
//                    let decoder = JSONDecoder()
//
//                    do{
//                        let quotes = try jsonResponse.rawData()
//                        let quote = try decoder.decode([QuotesModel].self, from: quotes)
//                        quoteArray = quote
//
//                        for quote in quoteArray {
//                            _ = self.saveQuestion(item: quote)
//
//                        }
//
//                        AppDefaults.isAppStartingFirstTime = true
//                    }
//
//                }
//                catch(let error){
//                    print("error: \(error.localizedDescription)")
//                }
//            }
//
//
//        }
//        else {
//            self.quoteArray = self.fetchAllQuotesFromCoreData()
//
//        }
//    }
        
    
    func fetchAllQuotesFromCoreData() -> [QuotesModel] {
        
        var Quotes = [QuotesModel]()
        let AppDel:AppDelegate = (UIApplication.shared.delegate as! AppDelegate)
        let context = AppDel.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Quotes")
    
        
        request.returnsObjectsAsFaults = false
        
        let results: NSArray = try! context.fetch(request) as NSArray
        if(results.count > 0)
        {
            var data: QuotesModel
            
            let x = (results.count) - 1
            
            for i in 0...x {
                
                let res = results[i] as! NSManagedObject
                
                let id = res.value(forKey: "id") as! Int
                let quotes = res.value(forKey: "quote") as? String
                let author = res.value(forKey: "author") as? String
                let favorite = res.value(forKey: "favorite") as! Int
                
                data =  QuotesModel(id: id, quote: quotes, author: author, isFavorite: favorite)
                Quotes.append(data)
            }
        }
        return Quotes
    }
    
    func fetchQuoteFromCoreData(id: Int) -> QuotesModel? {
        
        var quote: QuotesModel?
        let AppDel:AppDelegate = (UIApplication.shared.delegate as! AppDelegate)
        let context = AppDel.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Quotes")
        
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate.init(format: "id == %d", id)
        
        let results: NSArray = try! context.fetch(request) as NSArray
        if(results.count > 0)
        {
            var data: QuotesModel
            
            let x = (results.count) - 1
            
            for i in 0...x {
                
                let res = results[i] as! NSManagedObject
                
                let id = res.value(forKey: "id") as! Int
                let quotes = res.value(forKey: "quote") as? String
                let author = res.value(forKey: "author") as? String
                let favorite = res.value(forKey: "favorite") as! Int
                
                quote =  QuotesModel(id: id, quote: quotes, author: author, isFavorite: favorite)
                break
            }
        }
        return quote
    }
    
    func fetchFavoritesQuoteFromCoreData() -> [QuotesModel] {
        
        var Quotes = [QuotesModel]()
        let AppDel:AppDelegate = (UIApplication.shared.delegate as! AppDelegate)
        let context = AppDel.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Quotes")
        
        request.predicate = NSPredicate.init(format: "favorite == 1")
        
        request.returnsObjectsAsFaults = false
        
        let results: NSArray = try! context.fetch(request) as NSArray
        if(results.count > 0)
        {
            var data: QuotesModel
            
            let x = (results.count) - 1
            
            for i in 0...x {
                
                let res = results[i] as! NSManagedObject
                
                let id = res.value(forKey: "id") as! Int
                let quotes = res.value(forKey: "quote") as? String
                let author = res.value(forKey: "author") as? String
                let favorite = res.value(forKey: "favorite") as! Int
                
                data =  QuotesModel(id: id, quote: quotes, author: author, isFavorite: favorite)
                Quotes.append(data)
            }
        }
        return Quotes
    }
    
    func saveQuestion(item: QuotesModel) -> Bool {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity: NSEntityDescription = NSEntityDescription.entity(forEntityName: "Quotes", in: managedContext)!
        let entityData = NSManagedObject(entity: entity, insertInto: managedContext)
        
        
        entityData.setValue(item.id, forKey: "id")
        entityData.setValue(item.quote, forKey: "quote")
        entityData.setValue(item.author, forKey: "author")
        entityData.setValue(item.isFavorite, forKey: "favorite")
        
        
        do{
            try managedContext.save()
            appDelegate.saveContext()
        }
        catch{
            return false
        }
        print("\n\n Quotes getting saved......")
        return true
    }
    
    func updateFavorite(id: Int, isFavorite: Int) -> Bool{
        
        
        let AppDel:AppDelegate = (UIApplication.shared.delegate as! AppDelegate)
        
        let context = AppDel.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Quotes")
        
        request.predicate = NSPredicate.init(format: "id == %d", id )
        
        request.returnsObjectsAsFaults = false
        
        
        
        
        
        let results: NSArray = try! context.fetch(request) as NSArray
        
        
        
        print("\n\n Result: \(results.count)")
        
        
        
        if results.count > 0 {
            
            let duaObjectToUpdate = results[0] as! NSManagedObject
            
            duaObjectToUpdate.setValue(isFavorite, forKey: "favorite")
            
            
            do{
                
                try context.save()
                
                print("\n\n Favorite Updated")
                
            }
                
            catch
                
            {
                
                print(error)
                
            }
            
        }
        
        return true
    }
}

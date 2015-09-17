//
//  PersistenceHelper.swift
//  TaskApplication
//
//  Created by Michael Crump
//  Copyright (c) 2015 Michael Crump. All rights reserved.
//

import UIKit
import CoreData

class PersistenceHelper: NSObject {
    
    var appDel: AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
    var context: NSManagedObjectContext;
    
    override init(){
        context = appDel.managedObjectContext
    }
    
    func save(entity: String, parameters: Dictionary<String,String> )->Bool{
        
        let newEntity = NSEntityDescription.insertNewObjectForEntityForName(entity, inManagedObjectContext: context) 
        for (key, value) in parameters{
            newEntity.setValue(value, forKey: key)
        }
        
        do {
            try context.save()
            return true
        } catch _ {
            return false
        }
    }
    
    func list(entity: String ) ->NSArray{
        
        let request = NSFetchRequest(entityName: entity)
        request.returnsObjectsAsFaults = false;
        let results: NSArray = try! context.executeFetchRequest(request)
        return results
    }
    
    func remove(entity:String, key:String, value:String)->Bool{
        
        let request = NSFetchRequest(entityName: entity)
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "\(key) = %@", value)
        let results: NSArray = try! context.executeFetchRequest(request)
        
        if(results.count>0){
            
            let res = results[0] as! NSManagedObject
            context.deleteObject(res)
            do {
                try context.save()
            } catch _ {
            }
            return true
        }
        
        return false
    }
    
}
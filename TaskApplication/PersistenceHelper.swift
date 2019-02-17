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
    
  var appDel: AppDelegate = (UIApplication.shared.delegate as! AppDelegate)
  var context: NSManagedObjectContext;
  
  override init(){
    context = appDel.managedObjectContext
  }
  
  func construct(entity: String)-> Task? {
    return NSEntityDescription.insertNewObject(forEntityName: entity, into: context) as? Task
  }
  
  func list(entity: String ) -> [Task] {
    
    let request = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
    request.returnsObjectsAsFaults = false;
    let results: [Task] = try! context.fetch(request) as! [Task]
    return results
  }
  
  func remove(entity:String, instance: NSManagedObject) -> Bool {
    context.delete(instance)
    do {
      try context.save()
    } catch _ {
      return false
    }
    return true
  }
  
}

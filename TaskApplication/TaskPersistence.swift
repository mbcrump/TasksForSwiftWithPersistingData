//
//  PersistenceHelper.swift
//  TaskApplication
//
//  Created by Michael Crump
//  Copyright (c) 2015 Michael Crump. All rights reserved.
//

import UIKit
import CoreData

class TaskPersistence: NSObject {
    
  var appDel: AppDelegate
  var context: NSManagedObjectContext;
  
  override init() {
    appDel = (UIApplication.shared.delegate as! AppDelegate)
    context = appDel.managedObjectContext
  }
  
  func construct()-> Task? {
    return NSEntityDescription.insertNewObject(forEntityName: "Task", into: context) as? Task
  }
  
  func list() -> [Task] {
    let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Task")
    request.returnsObjectsAsFaults = false;
    let results: [Task] = try! context.fetch(request) as! [Task]
    return results
  }
  
  func remove(instance: NSManagedObject) -> Bool {
    context.delete(instance)
    do {
      try context.save()
    } catch _ {
      return false
    }
    return true
  }
  
}

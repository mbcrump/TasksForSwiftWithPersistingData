//
//  TaskManager.swift
//  TaskApplication
//
//  Created by Michael Crump
//  Copyright (c) 2015 Michael Crump. All rights reserved.
//

import UIKit

var taskMgr: TaskManager = TaskManager()

struct Task {
    var name = "Name"
    var description = "Description"
}

class TaskManager: NSObject {
    
    var tasks = [Task]()
    var persistenceHelper: PersistenceHelper = PersistenceHelper()
    
    override init(){
        
      let tempTasks:NSArray = persistenceHelper.list(entity: "Task")
        for res:Any in tempTasks {
          tasks.append(Task(name:(res as AnyObject).value(forKey:"name")as! String,description:(res as AnyObject).value(forKey:"desc") as! String))
        }
    }
    
    
    func addTask(name:String, desc: String){
        
        var dicTask: Dictionary<String, String> = Dictionary<String,String>()
        dicTask["name"] = name
        dicTask["desc"] = desc
        
      if(persistenceHelper.save(entity: "Task", parameters: dicTask)){
            tasks.append(Task(name: name, description:desc))
        }
    }
    
    func removeTask(index:Int){
        
        let value:String = tasks[index].name
        
      if(persistenceHelper.remove(entity: "Task", key: "name", value: value)){
        tasks.remove(at:index)
        }
    }

    
}

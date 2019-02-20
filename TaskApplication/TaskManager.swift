//
//  TaskManager.swift
//  TaskApplication
//
//  Created by Michael Crump
//  Copyright (c) 2015 Michael Crump. All rights reserved.
//  Changes by David Phillip Oster on 2/17/19.
// Added isDone BOOL here and in data model
// Rewrote Data Model to use just Core Data, without the unnecessary Dictionary<String, String>

import UIKit

var taskMgr: TaskManager = TaskManager()

class TaskManager: NSObject {
  var tasks: [Task]
  var taskPersistence: TaskPersistence

  override init() {
    taskPersistence = TaskPersistence()
    tasks = taskPersistence.list()
  }
  
  func addTask(name:String, desc: String, isDone: Bool)  {
    if let task = taskPersistence.construct() {
      task.desc = desc
      task.name = name
      task.isDone = isDone as NSNumber
      tasks.append(task)
    }
  }
  
  func removeTask(index: Int) {
    let task = tasks[index]
    if taskPersistence.remove(instance: task) {
      tasks.remove(at: index)
    }
  }
}

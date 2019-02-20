//
//  TableViewController.swift
//  TaskApplication
//
//  Created by Michael Crump
//  Copyright (c) 2015 Michael Crump. All rights reserved.
//  Changes by David Phillip Oster on 2/17/19.
// Added isDone BOOL here and in data model
// Rewrote Data Model to use just Core Data, without the unnecessary Dictionary<String, String>

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    

  @IBOutlet var tblTasks : UITableView!
  
  override func viewWillAppear(_ animated: Bool) {
    self.tblTasks.reloadData()
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
    return taskMgr.tasks.count
  }
  
  //Define how our cells look - 2 lines a heading and a subtitle
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: UITableViewCell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "Default Tasks")
    
    //Assign the contents of our var "items" to the textLabel of each cell
    let task = taskMgr.tasks[indexPath.row]
    let text = NSMutableAttributedString(string: task.name ?? "")
    if task.isDone?.boolValue ?? false {
      text.addAttribute(.strikethroughStyle, value: 1, range: NSMakeRange(0, text.length))
    }
    cell.textLabel!.attributedText = text
    cell.detailTextLabel!.text = task.desc
    
    return cell
  }
    
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == UITableViewCell.EditingStyle.delete {
      taskMgr.removeTask(index: indexPath.row)
      tblTasks.reloadData()
    }
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
    let isDone = taskMgr.tasks[indexPath.row].isDone?.boolValue ?? false
    taskMgr.tasks[indexPath.row].isDone = NSNumber(booleanLiteral: !isDone)
    tableView.deselectRow(at: indexPath, animated: true)
    tableView.reloadRows(at: [indexPath], with: .fade)
  }

}




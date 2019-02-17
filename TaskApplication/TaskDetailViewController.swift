//
//  TaskDetailViewController.swift
//  TaskApplication
//
//  Created by Michael Crump
//  Copyright (c) 2015 Michael Crump. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController, UITextFieldDelegate {
  
  @IBOutlet var txtTask: UITextField!
  @IBOutlet var txtDesc: UITextField!
  
  //Button Clicked
  @IBAction func btnAddTask(sender : UIButton){
    if (txtTask.text == ""){
      // Task Title is blank, do not add a record
    } else {
      // add record
      let name: String = txtTask.text!
      let description: String = txtDesc.text!
      taskMgr.addTask(name: name, desc: description, isDone: false)
      
      // dismiss keyboard and reset fields
      self.view.endEditing(true)
      txtTask.text = nil
      txtDesc.text = nil
      
    }
  }

  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.view.endEditing(true)
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool{
    textField.resignFirstResponder()
    return true
  }
  
}


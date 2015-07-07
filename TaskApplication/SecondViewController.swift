//
//  SecondViewController.swift
//  TaskApplication
//
//  Created by Michael Crump
//  Copyright (c) 2015 Michael Crump. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var txtTask: UITextField!
    @IBOutlet var txtDesc: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Button Clicked
    @IBAction func btnAddTask(sender : UIButton){
        if (txtTask.text == ""){
            //Task Title is blank, do not add a record
        } else {
            //add record
            var name: String = txtTask.text
            var description: String = txtDesc.text
            taskMgr.addTask(name, desc: description)
            
            //dismiss keyboard and reset fields
            
            self.view.endEditing(true)
            txtTask.text = nil
            txtDesc.text = nil
            
        }
    }
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
        
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }

}


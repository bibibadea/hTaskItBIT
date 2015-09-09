//
//  TaskDetailViewController.swift
//  hTaskItBIT
//
//  Created by Bibi Badea on 9/7/15.
//  Copyright © 2015 Stormbraces. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController {
    
    
    var detailTaskModel : TaskModel!
    var mainVC : ViewController!
    
    @IBOutlet weak var taskTextFIeld: UITextField!
    @IBOutlet weak var subtaskTextField: UITextField!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
  
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.taskTextFIeld.text = detailTaskModel.task
        self.subtaskTextField.text = detailTaskModel.subtask
        self.dueDatePicker.date = detailTaskModel.date!

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    


    
    
    @IBAction func cancelButtonTapped(sender: UIBarButtonItem) {
        
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    
    @IBAction func doneBarBUttonItemPressed(sender: UIBarButtonItem) {
//        
//        let task  = TaskModel(task: taskTextFIeld!.text!, subTask: subtaskTextField!.text!, date: dueDatePicker!.date, completed: false)
//
//        mainVC.baseArray[0][mainVC.tableView.indexPathForSelectedRow!.row] = task
//        
        let appDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        
        detailTaskModel.task = taskTextFIeld.text
        detailTaskModel.subtask = subtaskTextField.text
        detailTaskModel.date = dueDatePicker.date
        detailTaskModel.completed = detailTaskModel.completed
        
        appDelegate.saveContext()
        
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    
    //helpers
    
    
    

}

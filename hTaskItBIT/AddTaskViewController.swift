//
//  AddTaskViewController.swift
//  hTaskItBIT
//
//  Created by Bibi Badea on 9/8/15.
//  Copyright © 2015 Stormbraces. All rights reserved.
//

import UIKit
import CoreData

class AddTaskViewController: UIViewController {

    var mainVC : ViewController!
    
    @IBOutlet weak var taskFLD: UITextField!
    @IBOutlet weak var subtaskFLD: UITextField!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    
    
    /////////
    override func viewDidLoad() {
        super.viewDidLoad()


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    

    
    @IBAction func cancelButtonTapped(sender: UIButton) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }

    @IBAction func addTaskBTNTapped(sender: UIButton) {
        
//        var tasky : TaskModel = TaskModel(task: taskFLD.text!, subTask: subtaskFLD.text!, date: dueDatePicker.date, completed: false)
//        mainVC.baseArray[0].append(tasky)
        
        //coredata
        
        //create an entity
        
        let appDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        
        let managedObjectContext = appDelegate.managedObjectContext
        
        let entityDescription = NSEntityDescription.entityForName("TaskModel", inManagedObjectContext: managedObjectContext)
        
        let task : TaskModel = TaskModel(entity: entityDescription!, insertIntoManagedObjectContext: managedObjectContext)
        
        task.task = taskFLD.text
        task.subtask = subtaskFLD.text
        task.date = dueDatePicker.date
        task.completed = false
        
        appDelegate.saveContext()
        
        var request = NSFetchRequest(entityName: "TaskModel")
        var error :NSError? = nil
        //let results :NSArray = managedObjectContext.executeFetchRequest(request)

        do {
            let results = try managedObjectContext.executeFetchRequest(request)
//            return results
        } catch let error {
            print("error::::::: \(error)")
  //          return nil
        }
        
        
//        
//        do {
//            let fetchResults = try self.managedObjectContext?.executeFetchRequest(fetchRequest) as? [Image]
//            return fetchResults
//        } catch let fetchError as NSError {
//            print("getGalleryForItem error: \(fetchError.localizedDescription)")
//            return nil
//        }
        
        
//        
//        for res in results {
//            print(res)
//        }
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}

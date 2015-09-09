//
//  ViewController.swift
//  hTaskItBIT
//
//  Created by Bibi Badea on 9/7/15.
//  Copyright © 2015 Stormbraces. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate {

    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    var fetchedResultsController:NSFetchedResultsController = NSFetchedResultsController()
    
    @IBOutlet weak var tableView: UITableView!
    
    
//1    var taskArray : [Dictionary<String,String>] = []
//    var taskArray : [TaskModel] = []
   // var baseArray:[[TaskModel]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
            fetchedResultsController = getFetchedResultsController()
            fetchedResultsController.delegate = self
//            fetchedResultsController.performFetch(nil)
        do {
            try fetchedResultsController.performFetch()
        }
        catch let error as NSError? {
            print(error)
        }
        
//        
//        do {
//            try returningShowsResultsController!.performFetch()
//        }
//        catch let error as NSError {
//            print(error)
//        }
//        catch {
        

//        // Do any additional setup after loading the view, typically from a nib.
//        
//        let date1 = Date.from(year: 2034, month: 03, day: 02)
//        let date2 = Date.from(year: 2014, month: 12, day: 32)
//        let date3 = Date.from(year: 2001, month: 05, day: 05)
//        let datex = Date.from(year: 2002, month: 10, day: 28)
//        
//        let task1 = TaskModel(task: "Study Spanish", subTask: "Verbs", date: date3, completed: false)
//        let task2 = TaskModel(task: "Study Latin", subTask: "Nouns", date: date1, completed: false)
//        let task3 = TaskModel(task: "Study French", subTask: "jokes", date: date2, completed: false)
//        
//    var    taskArray = [task1, task2, task3, TaskModel(task: "GYm", subTask: "Leg Day", date: datex, completed: false)]
//         taskArray.append(TaskModel(task: "Study French", subTask: "jokes", date: date2, completed: false))
//        
//        var completedArray = [TaskModel(task: "Code", subTask: "curatenie", date: date2, completed: true)]
//        
//        baseArray = [taskArray, completedArray]
//        
////        let task1:Dictionary<String,String> =
////        [
////            "task": "Study French",
////            "subtask": "Verbs",
////            "date": "01/01.2002"
////        ]
////        
////        let task2:Dictionary<String,String> =
////        [
////            "task": "Food",
////            "subtask": "mcgoth",
////            "date": "01/01.2002"
////        ]
////        let task3:Dictionary<String,String> =
////        [
////            "task": "Learn Swift",
////            "subtask": "developer",
////            "date": "01/01.2002"
////        ]
//        
////        taskArray = [task1, task2, task3]
//
//        self.tableView.reloadData()
//        
//        
//        OOOOOO LLLLLLL  DDDD pt coredata
        
        
        
    }
    
override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
//    
//        tableView.reloadData()
//    
//    func sortByDate(taskOne:TaskModel, taskTwo:TaskModel) -> Bool {
//        
//        return taskOne.date.timeIntervalSince1970 < taskTwo.date.timeIntervalSince1970
//    }
    
//    taskArray = taskArray.sort(sortByDate)
//    baseArray[0] = baseArray[0].sort{
//        (taskOne: TaskModel, taskTwo: TaskModel) -> Bool in
//        
//        return taskOne.date.timeIntervalSince1970 < taskTwo.date.timeIntervalSince1970
//    }
    
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showTaskDetail" {
            let detailVC: TaskDetailViewController = segue.destinationViewController as! TaskDetailViewController
            
            let indexPath = self.tableView.indexPathForSelectedRow
            
//old            let thisTask = taskArray[indexPath!.row]
            //let thisTask = baseArray[(indexPath?.section)!][indexPath!.row]
            let thisTask = fetchedResultsController.objectAtIndexPath(indexPath!) as! TaskModel
            
            detailVC.detailTaskModel = thisTask
            detailVC.mainVC = self
            
        } else if segue.identifier == "showTaskAdd" {
            let addTaskVC:AddTaskViewController = segue.destinationViewController as! AddTaskViewController
            
            addTaskVC.mainVC = self
        }
        
        
    }
    
    
    @IBAction func addButtonTapped(sender: UIBarButtonItem) {
        
        self.performSegueWithIdentifier("showTaskAdd", sender: self)
        
    }
    
// ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ 
    //datasource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        return baseArray.count
        return fetchedResultsController.sections!.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//old        return taskArray.count
//        return baseArray[section].count
        return fetchedResultsController.sections![section].numberOfObjects
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        

        
//        let taskDict:Dictionary = taskArray[indexPath.row]
//old        let thisTask = taskArray[indexPath.row]
//        let thisTask = baseArray[indexPath.section][indexPath.row]
        let thisTask : TaskModel = fetchedResultsController.objectAtIndexPath(indexPath) as! TaskModel
        
        let cell : TaskCell = tableView.dequeueReusableCellWithIdentifier("myCell") as! TaskCell

        cell.taskLabel.text = thisTask.task
        cell.descriptionLabel.text = thisTask.subtask
        cell.dateLabel.text = Date.toString(date: thisTask.date!)
        
        
        return cell
    }
    
    //delegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print(indexPath.row)
        
        performSegueWithIdentifier("showTaskDetail", sender: self)
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "To do"
        } else {
            return "Completed"
        }
    }

    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
//        let thisTask = baseArray[indexPath.section][indexPath.row]
        let thisTask = fetchedResultsController.objectAtIndexPath(indexPath) as! TaskModel
        
        if indexPath.section == 0 {
        thisTask.completed = true
//        var newTask : TaskModel = TaskModel(task: thisTask.task, subTask: thisTask.subTask, date: thisTask.date, completed: true)
  //      baseArray[1].append(newTask)
        } else {
            thisTask.completed = false
    //        var newTask:TaskModel = TaskModel(task: thisTask.task, subTask: thisTask.subTask, date: thisTask.date, completed: false)
      //      baseArray[0].append(newTask)
        }
        
        //baseArray[indexPath.section].removeAtIndex(indexPath.row)
        
        //tableView.reloadData()
        
        (UIApplication.sharedApplication().delegate as! AppDelegate).saveContext()
        
    }
    
    
    
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        tableView.reloadData()
    }
    
    
    
    
    //help
    
    func taskFetchRequest() -> NSFetchRequest {
        let fetchRequest = NSFetchRequest(entityName: "TaskModel")
        
        let sortDescriptor = NSSortDescriptor(key: "date", ascending: true)
        
        
        let completedDescriptor = NSSortDescriptor(key: "completed", ascending: true)
        
        fetchRequest.sortDescriptors = [completedDescriptor, sortDescriptor]

        
        return fetchRequest
    }
    
    func getFetchedResultsController() -> NSFetchedResultsController {
        
        var fetchedResultsController = NSFetchedResultsController(fetchRequest: taskFetchRequest(), managedObjectContext: managedObjectContext, sectionNameKeyPath: "completed", cacheName: nil)
        return fetchedResultsController
    }
    
    
}


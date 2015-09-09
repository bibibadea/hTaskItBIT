//
//  TaskModel+CoreDataProperties.swift
//  hTaskItBIT
//
//  Created by Bibi Badea on 9/9/15.
//  Copyright © 2015 Stormbraces. All rights reserved.
//
//  Delete this file and regenerate it using "Create NSManagedObject Subclass…"
//  to keep your implementation up to date with your model.
//

import Foundation
import CoreData

extension TaskModel {

    @NSManaged var completed: NSNumber?
    @NSManaged var date: NSDate?
    @NSManaged var subtask: String?
    @NSManaged var task: String?

}

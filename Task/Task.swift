//
//  Task.swift
//  Task
//
//  Created by Chad Watts on 5/19/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import CoreData


class Task: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    convenience init?(name: String, notes: String, due: NSDate, isComplete: Bool, contex: NSManagedObjectContext = Stack.sharedStack.managedObjectContext) {
        
        guard let entity = NSEntityDescription.entityForName("Task", inManagedObjectContext: contex) else {
            
            return nil
        }
        
        self.init(entity: entity, insertIntoManagedObjectContext: contex)
        
        self.name = name
        self.notes = notes
        self.due = due
        self.isComplete = isComplete
        
    }
}

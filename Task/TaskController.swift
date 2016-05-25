//
//  TaskController.swift
//  Task
//
//  Created by Chad Watts on 5/19/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import CoreData

class TaskController {
    
    static let sharedController = TaskController()
    
    var tasks: [Task] = []
    
    var completedTasks: [Task] {
        
        let request = NSFetchRequest(entityName: "Task")
        
        let moc = Stack.sharedStack.managedObjectContext
        
        let tasks = (try? moc.executeFetchRequest(request)) as? [Task] ?? []
        return tasks.filter({$0.isComplete == true})
    }
    
    var inCompletedTasks: [Task] {
        
        let request = NSFetchRequest(entityName: "Task")
        
        let moc = Stack.sharedStack.managedObjectContext
        
        let tasks = (try? moc.executeFetchRequest(request)) as? [Task] ?? []
        return tasks.filter({$0.isComplete == false})
    }
    
    func addTask(name: String) {
        
        let _ = Task(name: name)
        saveToPersistentStore()
    }
    
}
   

        

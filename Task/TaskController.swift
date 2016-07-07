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
    
    var tasks: [Task] {
        
        let request = NSFetchRequest(entityName: "Task")
        let moc = Stack.sharedStack.managedObjectContext
        
        return (try? moc.executeFetchRequest(request)) as? [Task] ?? []
    }
    
    
    var completedTasks: [Task] {
        
        let request = NSFetchRequest(entityName: "Task")
        
        let moc = Stack.sharedStack.managedObjectContext
        
        return (try? moc.executeFetchRequest(request)) as? [Task] ?? []
        
    }
    
    var inCompletedTasks: [Task] {
        
        let request = NSFetchRequest(entityName: "Task")
        
        let moc = Stack.sharedStack.managedObjectContext
        
        return (try? moc.executeFetchRequest(request)) as? [Task] ?? []
    }
    
    func addTask(name: String, notes: String?, due: NSDate?) {
        
        saveToPersistentStorage()
    }
    
    func removeTask(task: Task) {
        
        saveToPersistentStorage()
        
        
    }
    
    func updateTask(task: Task, name: String, notes: String?, due: NSDate?, isComplete: Bool) {
        
        saveToPersistentStorage()
    }
    
    func saveToPersistentStorage() {
        
        do {
            try Stack.sharedStack.managedObjectContext.save()
                
        } catch {
            print("There was and error saving Managed Object Context!")
        }
    }
}
   

        

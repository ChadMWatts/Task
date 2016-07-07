//
//  TaskListTableViewController.swift
//  Task
//
//  Created by Chad Watts on 5/19/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class TaskListTableViewController: UITableViewController, NSFetchedResultsControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()


    // MARK: - Table view data source

        override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
            guard let sections = TaskController.sharedController.fetchedResultsController.sections else {return 1}
            return sections.count
        }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
   
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toDetail" {
            let taskTVC = segue.destinationViewController as? TaskListTableViewController
            if let indexPath = tableView.indexPathForSelectedRow {
                let task = TaskController.sharedController.tasks[indexPath.row]
                taskTVC?.task = task
                
            }
            
        }
        
    }

}

//
//  ItemViewController.swift
//  Homepwner
//
//  Created by Celena Haase on 4/8/16.
//  Copyright © 2016 Celena Haase. All rights reserved.
//
//  If you try to fix the type it breaks the connections, Contoller has no "r"
//  variables can be renames but not controller names or things in interface builder?


import UIKit

class ItemsViewContoller: UITableViewController {
    
    var itemStore: ItemStore!
    var imageStore: ImageStore!

    var holdTheSetCount = 0 //to loop through all the 8 items to start with
    
    @IBAction func addNewItem(sender: AnyObject){
        //Create a new item and add to the store
        //var anyInt = itemStore.holdTheSetCount
        
        
        let newItem = itemStore.createItem(holdTheSetCount)
        holdTheSetCount += 1
        //figure out where that item is in the array
        if let index = itemStore.allItems.indexOf(newItem){
        let indexPath = NSIndexPath(forRow: index, inSection: 0)
            
        //insert this new row into the table
        tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
    }
    
        
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemStore.allItems.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //Create instance 
        //let cell = UITableViewCell(style: .Value1, reuseIdentifier: "UITableViewCell")
        // Get new or recycled cell from prototype
        //let cell = tableView.dequeueReusableCellWithIdentifier("UITableViewCell", forIndexPath: indexPath)
        let cell = tableView.dequeueReusableCellWithIdentifier("ItemCell", forIndexPath: indexPath) as! ItemCell
        
        // Set the text on the cell with the description
        let item = itemStore.allItems[indexPath.row]
    
        // Configure the cell with the item
        cell.nameLabel.text = item.name
        cell.serialNumberLabel.text = item.serialNumber
        cell.valueLabel.text = "" //"\(item.valueInDollars)"
        
        //cell.textLabel?.text = item.name
        //cell.detailTextLabel?.text = "\(item.valueInDollars)"
        //make this a timer in minutes
        /*
        if indexPath.row == 4 {
            let alertController = UIAlertController(title: "MOM SEZ", message: "Did you get everything?", preferredStyle: .Alert)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) {
                //print("made it to cancel")
                (action) in print(action)
            }
            alertController.addAction(cancelAction)
            
            let destroyAction = UIAlertAction(title: "Carry On", style: .Destructive) {
                (action) in print(action)
                //print ("Made it to destroy")
            }
            alertController.addAction(destroyAction)
            
            self.presentViewController(alertController, animated: true) {
                // ...
            }
        } //end if condition of last run
        */
        // end of alert
        return cell 
    }
    // this is for something else and can be removed
    //var currentTaskIndex: Int = 0
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            let item = itemStore.allItems[indexPath.row]
            
            let title = "Confirm to delete \(item.name)?"
            let message = "Are you sure?"
            
            let ac = UIAlertController(title: title, message: message, preferredStyle: .ActionSheet)
            // define cancel
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler:nil)
            // do cancel - nothing
            ac.addAction(cancelAction)
            
            let deleteAction = UIAlertAction(title: "Delete", style: .Destructive, handler:
                {(action) -> Void in
                    self.itemStore.removeItem(item)
                    //remove from table view with animation
                    self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
                    }) //end of type of alert Action
            ac.addAction(deleteAction)
            
            presentViewController(ac, animated: true, completion: nil)
        }
    } //commmit editing style
    
    override func tableView(tableView:UITableView, moveRowAtIndexPath
        sourceIndexPath:NSIndexPath, toIndexPath destinationIndexPath:NSIndexPath){
        //update the model
        itemStore.moveItemAtIndex(sourceIndexPath.row, toIndex: destinationIndexPath.row)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowItem" {
            if let row = tableView.indexPathForSelectedRow?.row {
                
                let item = itemStore.allItems[row]
                let detailViewController = segue.destinationViewController as! DetailViewController
                detailViewController.item = item
                detailViewController.imageStore = imageStore
            }
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.rowHeight = 65
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        navigationItem.leftBarButtonItem = editButtonItem()
    }
    
}





//
//  ItemStore.swift
//  Homepwner
//
//  Created by Celena Haase on 4/8/16.
//  Copyright © 2016 Celena Haase. All rights reserved.
//

import UIKit

class ItemStore {
    
    var allItems = [Item]()
    
  //  func createItem() -> Item {
  //      let newItem = Item(random: true)
        //  other options below
        //  let newItem = Item(name: "Start Here", serialNumber: "", valueInDollars: 100)
        //  let newItem = Item(setCount: holdTheSetCount)
    
    func createItem(moveIt: Int) -> Item {
        //var holdTheSetCount = 0 //this has to happen in the controller which can keep track of it
        
        let newItem = Item(setCount: moveIt) // which is holdTheSetCount)
        
        allItems.append(newItem)
        //holdTheSetCount += 1
        
        return newItem
        
    } //end function
    
    func removeItem(item: Item) {
        if let index = allItems.indexOf(item){
            allItems.removeAtIndex(index)
            }
        }
    
  
    
    
    func moveItemAtIndex(fromIndex: Int, toIndex:Int){
        if fromIndex == toIndex {
            return
            }
    //get reference
    let movedItem = allItems[fromIndex]
    //remove it
    allItems.removeAtIndex(fromIndex)
    //insert item
    allItems.insert(movedItem, atIndex: toIndex)
}
   // to create some items
  /*  init() {
        //  count
        var holdTheSetCount: Int = 0
        
        for _ in 0..<5 {
           
            createItem()
            //createItem(holdTheSetCount)
            
            holdTheSetCount += 1
        }
    }// end init
   */
    
    
} //end class




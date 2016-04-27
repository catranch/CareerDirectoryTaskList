//
//  Item.swift
//  Homepwner
//
//  Created by Celena Haase on 4/8/16.
//  Copyright © 2016 Celena Haase. All rights reserved.
//

import UIKit

class Item: NSObject {
    var name: String
    var valueInDollars: Int
    var serialNumber: String?
    let dateCreated: NSDate
    let itemKey: String
    
    
    init (name:String, serialNumber:String?, valueInDollars:Int){
        self.name = name
        self.valueInDollars = valueInDollars
        self.serialNumber = serialNumber
        self.dateCreated = NSDate()
        self.itemKey = NSUUID().UUIDString
        super.init()
    }
   //convenience init(random:Bool=false){
   //     if random {
        //random is in itemStore.swift - it has to be changed - see comments on that file
 
    convenience init(setCount: Int = 0){
        if setCount < 8{
    
     //   let amount = ["Do"] //cards
        let nouns = ["Go to the Career Office",
                     "Search for an internship",
                     "Go to the library",
                     "Google that career",
                     "Find a student group",
                     "Search Meetup.com",
                     "Find a mentor",
                     "See a counselor",
                     "Take a quiz"]  //tasks
        
        // do the count here random
        //let currentIndex = arc4random_uniform(UInt32(nouns.count))
        //let timeTask = arc4random_uniform(UInt32(amount.count))
        //do the count 0 to amount.count -1
        
        //set it up right here
          //  let setCount: Int = 0
          //  if setCount < (nouns.count - 1) {
        
        //let presetAmount = amount[Int(timeTask)]
 /*here too*/
        //let presetNoun = nouns[Int(currentIndex)]
        let presetNoun = nouns[Int(setCount)]
        let randomName = "\(presetNoun)"
        //let randomName = "\(presetAmount) \(presetNoun)"
        //let randomSerialNumber = NSUUID().UUIDString.componentsSeparatedByString("-").first!
        let phoneDirectory = ["310.338.2871","careers.lmu.edu","310.338.2788","Let me google that for you","310.338.2877",
                              "Get off campus and explore","Mentors are waiting to meet you!","Get sage advise","Explore new ideas"]
        let phoneDirectoryListing = phoneDirectory[Int(setCount)]
        //self.init(name: randomName, serialNumber: randomSerialNumber, valueInDollars:  0)
            self.init(name: randomName, serialNumber: phoneDirectoryListing, valueInDollars: 0)
            // setCount += 1 //in other file
            }//end set count
        
        //}
    else{
    self.init(name: "", serialNumber: nil, valueInDollars:  0)
    }
} //convenience init

    /*
    convenience init(random:Bool=false){
        if random {
            let adjectives = ["Do 1 item for ","Hour on ","Update about "] //cards
            let nouns = ["Eliza","Code at Nerd Ranch","Dan's Fire App","Eduard","Tyler",
                         "Career Center App","TIAA-Chase-Taxes","Grocery-Library","LMU-Prep"]  //tasks
            
            var idx = arc4random_uniform(UInt32(adjectives.count))
            let randomAdjective = adjectives[Int(idx)]
            
            idx = arc4random_uniform(UInt32(nouns.count))
            let randomNoun = nouns[Int(idx)]
            
            let randomName = "\(randomAdjective) \(randomNoun)"
            let randomValue = Int(arc4random_uniform(UInt32(100)))
            let randomSerialNumber = NSUUID().UUIDString.componentsSeparatedByString("-").first!
            
            self.init(name: randomName,
                      serialNumber: randomSerialNumber,
                      valueInDollars: randomValue)
            
        } //random
        else{
            self.init(name: "", serialNumber: nil, valueInDollars:  0)
        }
    } //convenience init
    */
} //end of class



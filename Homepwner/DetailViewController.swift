//
//  DetailViewController.swift
//  Homepwner
//
//  Created by Celena Haase on 4/19/16.
//  Copyright © 2016 Celena Haase. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate  {
    
    @IBOutlet var nameField: UITextField!
    
    @IBOutlet var serialNumberField: UITextField!
    
    @IBOutlet var valueField: UITextField!
    
    @IBOutlet var dateLabel: UILabel!
    
    @IBOutlet var imageView: UIImageView!
    
    @IBAction func takePicture(sender: UIBarButtonItem) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .PhotoLibrary
        imagePicker.delegate = self
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    var item: Item! {
        didSet {
            navigationItem.title = item.name
        }
    }
    
    var imageStore: ImageStore!
    
    let numberFormatter: NSNumberFormatter = {
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .DecimalStyle
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    override func viewWillAppear(animated: Bool){
        super.viewWillAppear(animated)
        
        nameField.text = item.name
        serialNumberField.text = item.serialNumber
        //valueField.text = "\(item.valueInDollars)"
        valueField.text = numberFormatter.stringFromNumber(item.valueInDollars)
        dateLabel.text = "\(item.dateCreated)"
        
        //get the item key
        let key = item.itemKey
        //display
        let imageToDisplay = imageStore.imageForKey(key)
        imageView.image = imageToDisplay
        
    }
    
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        //save changes to item
        item.name = nameField.text ?? ""
        item.serialNumber = serialNumberField.text
       if let valueText = valueField.text,
            value = numberFormatter.numberFromString(valueText){
            item.valueInDollars = value.integerValue
            }
            else{
            item.valueInDollars = 0
            }
    }
    
    //camera time!
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        // Get image from dictionary
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        //store the image in the ImageStore
        imageStore.setImage(image, forKey:item.itemKey)
        
        //put the image onthe screen
        imageView.image = image
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    }

//
//  ImageStore.swift
//  Homepwner
//
//  Created by Celena Haase on 4/22/16.
//  Copyright © 2016 Celena Haase. All rights reserved.
//

import UIKit

class ImageStore {
    let cache = NSCache()


func setImage(image:UIImage, forKey key:String) {
    cache.setObject(image, forKey: key)

}

func imageForKey(key:String) -> UIImage?{
    return cache.objectForKey(key) as? UIImage
}

func deleteImageForKey(key: String){
    cache.removeObjectForKey(key)
}
}


//
//  CacheHelper.swift
//  CacheImage
//
//  Created by Anish on 1/6/16.
//  Copyright © 2016 Anish. All rights reserved.
//

import Foundation


class ImageCacheHelper{
    
    static var cache = NSCache()
    static var isNotRunningDispatch:Bool = true
    
    class  func setObjectForKey(imageData:NSData,imageKey:String){
        
        ImageCacheHelper.cache.setObject(imageData, forKey: imageKey)
        
    }
    
    class  func getObjectForKey(imageKey:String)->NSData?{
        
        return ImageCacheHelper.cache.objectForKey(imageKey) as? NSData
        
    }
    
    class func getImage(imageUrl:String,completionHandler:(NSData)->()){
        if ImageCacheHelper.isNotRunningDispatch{
            
            ImageCacheHelper.isNotRunningDispatch = false
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), {
                let imgUrl = NSURL(string:imageUrl)
                let imageData = NSData(contentsOfURL: imgUrl!)!
                ImageCacheHelper.setObjectForKey(imageData,imageKey: "\(imageUrl.hashValue)")
                ImageCacheHelper.isNotRunningDispatch = true
                completionHandler(imageData)
                
            })
        }else{
            print("alerady started loading image")
        }
    }
}

//
//  ViewController.swift
//  CacheImage
//
//  Created by Anish on 1/4/16.
//  Copyright © 2016 Anish. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userProfileImgView: UIImageView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!{
        didSet{
            
            activityIndicator.hidesWhenStopped = true
            
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCachedImageIfExists()
        
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func getCachedImageIfExists(){
        
        let userImageUrl = "http://images5.fanpop.com/image/polls/1048000/1048014_1339191718506_full.jpg"
//        let fileManager = NSFileManager.defaultManager()
//        let diskPaths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.CachesDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        let cacheDirectory = diskPath[0] as NSString
        let diskPath = cacheDirectory.stringByAppendingPathComponent("\(userImageUrl.hashValue)")
        if let data = ImageCacheHelper.getObjectForKey(imageKey: "\(userImageUrl.hashValue)"){
            
            let userImage =  UIImage(data: data as Data)
            self.userProfileImgView.image = userImage
             print("loaded first VC image from Cache")
            
        }else if fileManager.fileExistsAtPath(diskPath){
            
            let image =  UIImage(contentsOfFile: diskPath)!
            self.userProfileImgView.image = image
            ImageCacheHelper.setObjectForKey(UIImageJPEGRepresentation(image, 1.0)!, imageKey: "\(userImageUrl.hashValue)")
            print("loaded first VC image from Cache temp directory")
            
        }else{
            activityIndicator.startAnimating()
            ImageCacheHelper.getImage(userImageUrl){ imageData in
                
                imageData.writeToFile(diskPath, atomically: true)
                dispatch_async(dispatch_get_main_queue()){
                    
                    let userImage =  UIImage(data: imageData)
                    self.userProfileImgView.image = userImage
                    self.activityIndicator.stopAnimating()
                      print("loaded first VC image from URL")
                    
                }
                
            }
            
        }
    }
}


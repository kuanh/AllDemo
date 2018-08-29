//
//  MyImageCache.swift
//  DemoSplitViewControllerCassini
//
//  Created by KuAnh on 10/11/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class MyImageCache {
    static let sharedCache: NSCache <NSString, UIImage> =  {
        let cache = NSCache<NSString, UIImage>()
        cache.name = "MyImageCache"
        cache.countLimit = 20 // Max 20 images in memory.
        cache.totalCostLimit = 10*1024*1024 // Max 10MB used.
        return cache
    }()
}


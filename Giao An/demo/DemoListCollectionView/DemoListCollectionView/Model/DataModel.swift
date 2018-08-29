//
//  DataModel.swift
//  DemoListCollectionView
//
//  Created by KuAnh on 03/03/2018.
//  Copyright © 2018 KuAnh. All rights reserved.
//

import UIKit

class DataModel {
    var imageView: UIImage?
    var nameTree: String
    
    init(img: UIImage?, name: String) {
        self.imageView = img
        self.nameTree = name
    }
}

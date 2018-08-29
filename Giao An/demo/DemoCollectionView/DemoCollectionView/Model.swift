//
//  Model.swift
//  DemoCollectionView
//
//  Created by KuAnh on 02/03/2018.
//  Copyright © 2018 KuAnh. All rights reserved.
//

import UIKit

class Model {
    var progressView: Float
    var imageTree: UIImage?
    var name: String
    
    init?(progressView: Float, imgTree: UIImage?, name: String) {
        self.imageTree = imgTree
        self.progressView = progressView
        self.name = name
    }
}

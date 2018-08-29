//
//  Student.swift
//  FoodTracker
//
//  Created by KuAnh on 05/05/2018.
//  Copyright © 2018 KuAnh. All rights reserved.
//

import UIKit
class Student {
    var idStd: String
    var name: String
    var imageStd: UIImage
    
    init(id: String, name: String, image: UIImage) {
        self.idStd = id
        self.name = name
        self.imageStd = image
    }
}

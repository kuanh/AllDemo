//
//  Student.swift
//  DemoThemSuaXoa
//
//  Created by KuAnh on 28/03/2018.
//  Copyright © 2018 KuAnh. All rights reserved.
//

import UIKit

class Student: NSObject {
    var name: String
    var age: Int
    var photo: UIImage?
    
    init?(name: String, age: Int, photo: UIImage?) {
        
        guard !name.isEmpty else {
            return nil
        }
        
        guard (age >= 1) && (age <= 150) else{
            return nil
        }
        
        if name.isEmpty || age < 1 {
            return nil
        }
        
        self.name = name
        self.age = age
        self.photo = photo
    }
}

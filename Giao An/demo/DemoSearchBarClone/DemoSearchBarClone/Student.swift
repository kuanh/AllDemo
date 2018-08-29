//
//  Student.swift
//  DemoSearchBar
//
//  Created by KuAnh on 30/03/2018.
//  Copyright © 2018 KuAnh. All rights reserved.
//

import UIKit
import os.log

class Student: NSObject, NSCoding {
    var name: String
    var age: Int
    var photo: UIImage?
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("students")
    
    struct propertyKey {
        static let name = "name"
        static let age = "age"
        static let photo = "photo"
    }
    
    init?(name: String, age: Int, photo: UIImage?) {
        
        guard !name.isEmpty else {
            return nil
        }
        
        guard age >= 1 else {
            return nil
        }
        
        if name.isEmpty || age < 1 {
            return nil
        }
        
        self.name = name
        self.age = age
        self.photo = photo
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: propertyKey.name)
        aCoder.encode(age, forKey: propertyKey.age)
        aCoder.encode(photo, forKey: propertyKey.photo)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let name = aDecoder.decodeObject(forKey: propertyKey.name) as? String else {
            os_log("Unable to decode the name for a Meal object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        let age = aDecoder.decodeInteger(forKey: propertyKey.age)
        let photo = aDecoder.decodeObject(forKey: propertyKey.photo) as? UIImage
        
        
        self.init(name: name, age: age, photo: photo)
    }
}

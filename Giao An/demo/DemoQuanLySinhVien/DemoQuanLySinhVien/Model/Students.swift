//
//  Students.swift
//  DemoQuanLySinhVien
//
//  Created by KuAnh on 28/02/2018.
//  Copyright © 2018 KuAnh. All rights reserved.
//

import Foundation
struct Students: PlaceProtocol, Equatable {
    static func ==(lhs: Students, rhs: Students) -> Bool {
        return lhs.name == rhs.name
    }
    
    var name: String
    var classCode: String
    var studentCode: String
    var age: Int
    var address: String
    var photo: String
    
    init?(name: String, classCode: String, studentCode: String, age: Int, address: String, photo: String ) {
        guard !name.isEmpty else { return nil }
        guard !classCode.isEmpty else { return nil }
        guard !studentCode.isEmpty else { return nil }
        guard age > 0 else { return nil }
        guard !address.isEmpty else { return nil }
        guard !photo.isEmpty else { return nil }
        
        self.name = name
        self.classCode = classCode
        self.studentCode = studentCode
        self.age = age
        self.address = address
        self.photo = photo
    }
    
    init?(dict: Dictionary<AnyHashable, Any>) {
        print(dict)
        guard let name = dict["StudentName"] as? String else { return nil }
        guard let classCode = dict["ClassCode"] as? String else { return nil }
        guard let studentCode = dict["StudentCode"] as? String else { return nil }
        guard let age = dict["StdAge"] as? Int else { return nil }
        guard let address = dict["StdAddress"] as? String else { return nil }
        guard let photo = dict["StdImage"] as? String else { return nil }
        
        self.init(name: name, classCode: classCode, studentCode: studentCode, age: age, address: address, photo: photo)
        
    }
    
    
}

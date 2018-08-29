//
//  School.swift
//  DemoQuanLySinhVien
//
//  Created by KuAnh on 28/02/2018.
//  Copyright © 2018 KuAnh. All rights reserved.
//

import Foundation

struct School: PlaceProtocol, Equatable {
    static func ==(lhs: School, rhs: School) -> Bool {
        return lhs.name == rhs.name
        
    }
    
    var name: String
    var schoolCode: Int
    
    init?(code: Int, name: String) {
        guard code > 0 else { return nil }
        guard !name.isEmpty else { return nil }
        self.schoolCode = code
        self.name = name
    }
    //parse du lieu de dk model school
    init?(dict: Dictionary<AnyHashable, Any>) {
        guard let schoolCode = dict["SchoolCode"] as? Int else { return nil }
        guard let schoolName = dict["SchoolName"] as? String else { return nil }
        self.init(code: schoolCode, name: schoolName)
    }
    
}

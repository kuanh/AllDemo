//
//  Class.swift
//  DemoQuanLySinhVien
//
//  Created by KuAnh on 28/02/2018.
//  Copyright © 2018 KuAnh. All rights reserved.
//

import Foundation
struct Class  : PlaceProtocol, Equatable {
    static func ==(lhs: Class, rhs: Class) -> Bool {
        return lhs.name == rhs.name
    }
    
    var name: String
    var classCode: String
    var shoolCode: School
    
    init?(code: Int, classCode: String, name: String) {
        guard code > 0 else { return nil}
        guard !classCode.isEmpty else { return nil }
        guard !name.isEmpty else {return nil}
        
        self.classCode = classCode
        self.shoolCode = code
        self.name = name
    }
    
    init?(dict: Dictionary<AnyHashable, Any>) {
        guard let name = dict["ClassName"] as? String else { return nil }
        guard let classCode = dict["ClassCode"] as? String else { return nil }
        guard let code = dict["SchoolCode"] as? Int else { return nil }
        self.init(code: code, classCode: classCode, name: name)
    }
}

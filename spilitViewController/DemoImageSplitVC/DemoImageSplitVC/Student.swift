//
//  Student.swift
//  DemoImageSplitVC
//
//  Created by KuAnh on 05/11/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

enum Weapon {
    case std1, std2, std3, std4, std5
}

class Student: NSObject {
    var name: String
    var photo: Weapon
    
    init(name: String, photo: Weapon) {
               
        self.name = name
        self.photo = photo
    }
    
    func weaponImage() -> UIImage? {
        switch self.photo {
        case .std1:
            return UIImage(named: "std1")
        case .std2:
            return UIImage(named: "std2")
        case .std3:
            return UIImage(named: "std3")
        case .std4:
            return UIImage(named: "std4")
        case .std5:
            return UIImage(named: "std5")
            
        }
    }
}

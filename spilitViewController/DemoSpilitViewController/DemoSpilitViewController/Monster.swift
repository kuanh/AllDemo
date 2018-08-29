//
//  Monster.swift
//  DemoSpilitViewController
//
//  Created by KuAnh on 05/11/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

enum Weapon {
    case std1, std2, std3, std4, std5
}

class Monster: NSObject {
    let name: String
    let description1: String
    let iconName: String
    let weapon: Weapon
    
    init(name: String, description1: String, iconName: String, weapon: Weapon) {
        self.name = name
        self.description1 = description1
        self.iconName = iconName
        self.weapon = weapon
    }
    
    func weaponImage() -> UIImage? {
        switch self.weapon {
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

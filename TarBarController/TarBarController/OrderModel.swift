//
//  OrderModel.swift
//  TarBarController
//
//  Created by KuAnh on 23/05/2018.
//  Copyright © 2018 KuAnh. All rights reserved.
//

import Foundation
class OrderModel: NSObject {
    var pizza:String = "No"
    var pie:String = "No"
    
    func currentOrder() -> String{ //return a string with the current order
        return pizza + " pizza and " + pie + " pie"
    }
}   

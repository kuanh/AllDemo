//
//  MyDelegate.swift
//  DemoDataSourceDelegateViewController
//
//  Created by KuAnh on 14/10/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

protocol ExampleDelegate {
    func passData(data: [Int]) -> [Int]
}

class MyDelegate {
    var delegate: ExampleDelegate?
}

//
//  PlaceProtocol.swift
//  DemoQuanLySinhVien
//
//  Created by KuAnh on 28/02/2018.
//  Copyright © 2018 KuAnh. All rights reserved.
//

import Foundation
protocol PlaceProtocol {
    var name: String {get}
    init?(dict: Dictionary<AnyHashable, Any>)
}







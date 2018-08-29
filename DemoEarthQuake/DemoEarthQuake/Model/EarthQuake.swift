//
//  EarthQuake.swift
//  DemoEarthQuake
//
//  Created by KuAnh on 04/06/2018.
//  Copyright © 2018 KuAnh. All rights reserved.
//

import Foundation
typealias DICT = Dictionary<AnyHashable, Any>

class EarthQuake {
    var timeInterval: Double
    var mag: Double
    var place: String
    
    init?(dict: DICT) {
        guard let properties = dict["properties"] as? DICT else { return nil}
        guard let time = properties["time"] as? Double,
        let mag = properties["mag"] as? Double,
        let place = properties["place"] as? String else { return nil}
        
        self.timeInterval = time
        self.mag = mag
        self.place = place
    }
}


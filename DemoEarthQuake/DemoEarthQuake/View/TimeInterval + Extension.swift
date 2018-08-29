//
//  TimeInterval + Extension.swift
//  DemoEarthQuake
//
//  Created by KuAnh on 13/06/2018.
//  Copyright © 2018 KuAnh. All rights reserved.
//

import Foundation

extension TimeInterval {
    func convertDateTime() -> (dateString: String, timeString: String) {
        var dateString = ""
        var timeString = ""
        let date = Date.init(timeIntervalSince1970: (self / 1000))
        
        let dateForrmat = DateFormatter()
        dateForrmat.dateFormat = "yyyy-MM-dd"
        dateForrmat.dateStyle = .long
        dateString = dateForrmat.string(from: date)
        
        let timeFormat = DateFormatter()
        timeFormat.dateFormat = "HH:mm"
        timeFormat.timeStyle = .short
        timeString = timeFormat.string(from: date)
        
        return (dateString, timeString)
    }
}

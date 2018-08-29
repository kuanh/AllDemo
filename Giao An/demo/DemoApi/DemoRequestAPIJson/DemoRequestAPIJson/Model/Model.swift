//
//  Model.swift
//  DemoRequestAPIJson
//
//  Created by KuAnh on 19/12/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

typealias JSON  = Dictionary<AnyHashable, Any>

struct Weathers {
    var location: Location
    var current: Current
    var forecast: Forecast
    
    init?(json: JSON) {
        guard let locationJson = json["location"] as? JSON, let currentJson = json["current"] as? JSON, let forecastJson = json["forecast"] as? JSON else { return nil }
        guard let location = Location(json: locationJson) else { return nil }
        guard let current = Current(json: currentJson) else { return nil }
        guard let forecast = Forecast(json: forecastJson) else { return nil }
        self.location = location
        self.current = current
        self.forecast = forecast
    }
}

struct Location {
    var name: String
    var country: String
    var localtime: String
    
    init?(json: JSON) {
        guard let name = json["name"] as? String, let country = json["country"] as? String, let localtime = json["localtime"] as? String else { return nil }
        
        self.name = name
        self.country = country
        self.localtime = localtime
    }
}

struct Current {
    var tempc: Int
    var condition: Condition
    
    init?(json: JSON) {
        guard let tempC = json["temp_c"] as? Int, let conditionJson = json["condition"] as? JSON else { return nil }
        guard let condition = Condition(json: conditionJson) else { return nil }
        self.tempc = tempC
        self.condition = condition
    }
    
}

struct Condition {
    var text: String
    var icon: String
    
    init?(json: JSON) {
        guard let text = json["text"] as? String, let icon = json["icon"] as? String else {return nil}
        self.text = text
        self.icon = icon
    }
}

struct Forecast {
    var forecastday: [String: Any]
    
    init?(json: JSON) {
        guard let forecastday = json["forecastday"] as? [String: Any] else { return nil }
        self.forecastday = forecastday
    }
}

struct Forecastday {
    var maxtemp_c: Double
    var mintemp_c: Double
    var condition: Condition
    
}



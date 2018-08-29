//
//  DataServices.swift
//  DemoRequestAPIJson
//
//  Created by KuAnh on 19/12/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class DataServices {
    
    
    static let shared = DataServices()
    
    private var _weather: Weathers?
    var weather: Weathers? {
        get {
            if _weather == nil {
                request(complete: {
                    self._weather = Weathers(json: $0)
                    NotificationCenter.default.post(name: Notification.Name.init("fileJson"), object: self, userInfo: nil)
                })
            }
            return _weather
        }
        set {
            _weather = newValue
        }
    }
    
    
    func request(complete:@escaping (_ dict: JSON) -> ()) {
        
        let urlString = "http://api.apixu.com/v1/current.json?key=a07fd380e65f42a2a6692244171812&q=Paris"
            guard let url = URL(string: urlString) else {return }
        let urlRequest = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: urlRequest)  { (data, response, error) in
        
            guard let aData = data else {
                print("Error: did not receive data")
                return
            }
            do {
                guard let dict = try JSONSerialization.jsonObject(with: aData, options: .mutableContainers) as? JSON else {
                    print("error trying to convert data to JSON")
                    return
                }
                DispatchQueue.main.async {
                    complete(dict)
                }
            } catch let error {
                print(error)
            }
        
        }
        task.resume()
    }
}

//
//  DataService.swift
//  DemoEarthQuake
//
//  Created by KuAnh on 04/06/2018.
//  Copyright © 2018 KuAnh. All rights reserved.
//

import Foundation

class DataService {
    static let share = DataService()    
    
    func loadEarthQuake(complete: @escaping ([EarthQuake])->Void) {
        let urlString = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/4.5_week.geojson"
        guard let url = URL(string: urlString) else { return }
        let urlRequest = URLRequest(url: url)
        
        var earthQuake : [EarthQuake] = []
        
        DispatchQueue.global().async {
            let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data, reponse, error) in
                guard error == nil else {
                    print(error!.localizedDescription)
                    return
                }
                
                guard let aData = data else { return }
                
                do{
                    guard let jsonObject = try JSONSerialization.jsonObject(with: aData, options: .mutableContainers) as? DICT,
                        let features = jsonObject["features"] as? [DICT] else { return }
                    for feature in features {
                        if let properties = EarthQuake(dict: feature) {
                            earthQuake.append(properties)
                        }
                    }
                    
                    DispatchQueue.main.async {
                        complete(earthQuake)
                    }
                }
                catch{
                    print(error.localizedDescription)
                }
                
            })
            task.resume()
        }
    }
}

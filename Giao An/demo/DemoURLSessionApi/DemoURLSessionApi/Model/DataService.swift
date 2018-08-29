//
//  DataService.swift
//  DemoURLSessionApi
//
//  Created by KuAnh on 15/05/2018.
//  Copyright © 2018 KuAnh. All rights reserved.
//

import UIKit

class DataService {
    
    static let shared = DataService()
    
    func loadChampsInfo(complete: @escaping ([InfomationChampion])->Void) {
        let urlString = "http://infomationchampion.pe.hu/showInfo.php?index=1&number=20"
        guard let url = URL(string: urlString) else { return }
        let urlRequest = URLRequest(url: url)
        var champs: [InfomationChampion] = []
        DispatchQueue.global().async {
            let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
                guard error == nil else {
                    print(error!.localizedDescription)
                    return
                }
                
                guard let aData = data else { return }
                do {
                    guard let jsonObject = try JSONSerialization.jsonObject(with: aData, options: .mutableContainers) as? [JSON] else { return }
                    
                    for champObject in jsonObject {
                        if let champ = InfomationChampion(json: champObject) {
                            champs.append(champ)
                        }
                    }
                    
                    DispatchQueue.main.async {
                        complete(champs)
                    }
                    
                } catch {
                    print(error.localizedDescription)
                }
            })
            task.resume()
        }
    }
}


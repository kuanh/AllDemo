//
//  DemoURL.swift
//  DemoCassini
//
//  Created by KuAnh on 08/11/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import Foundation

struct DemoURl {
    static let Standford = "http://anhnendep.net/wp-content/uploads/2016/02/league-of-legend-lien-minh-huyen-thoai.jpg"
    static let LMHT = ["Sona": "http://anhnendep.net/wp-content/uploads/2016/02/league-of-legend-lien-minh-huyen-thoai-07.jpg",
                       "Hecarim": "http://anhnendep.net/wp-content/uploads/2016/02/league-of-legend-lien-minh-huyen-thoai-02.jpg",
                       "Irelia": "http://anhnendep.net/wp-content/uploads/2016/02/league-of-legend-lien-minh-huyen-thoai-03.jpg",
                       "Katarina": "http://anhnendep.net/wp-content/uploads/2016/02/league-of-legend-lien-minh-huyen-thoai-06.jpg"]
    
    static func LMHTImageNamed(imageName: String?) -> URL? {
        guard let urlString = LMHT[imageName ?? ""] else {
            return nil
        }
        return URL(string: urlString)
        
    }
}

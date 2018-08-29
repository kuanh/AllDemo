//
//  InformationChampion.swift
//  DemoURLSessionApi
//
//  Created by KuAnh on 15/05/2018.
//  Copyright © 2018 KuAnh. All rights reserved.
//

import Foundation

typealias JSON = Dictionary<AnyHashable, Any>

class InfomationChampion {
    var id_Champ: String
    var nameEN_Champ: String
    var nameVN_Champ: String
    var level_Champ: String
    var url_Champ: String
    
    init?(json: JSON) {
        guard let id_Champ = json["id_Champ"] as? String, let nameEN_Champ = json["nameEN_Champ"] as? String, let nameVN_Champ = json["nameVN_Champ"] as? String, let level_Champ = json["level_Champ"] as? String, let url_Champ = json["url_Champ"] as? String else { return nil }
        self.id_Champ = id_Champ
        self.nameEN_Champ = nameEN_Champ
        self.nameVN_Champ = nameVN_Champ
        self.level_Champ = level_Champ
        self.url_Champ = url_Champ
    }
}



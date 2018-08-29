//
//  DemoURL.swift
//  DemoSplitViewControllerCassini
//
//  Created by KuAnh on 10/11/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import Foundation

struct DemoURL {
    static let Standford = "https://cdn.spacetelescope.org/archives/images/large/heic1509a.jpg"
    
    static let HERO = ["Goku": "http://statis.infogame.vn/images/upload/2017/08/21/108_gkPi16DOeV_gokutransformacion01_030717.jpg?w=680",
                       "GokuGod": "http://taigamemienphivedienthoai.info/wp-content/uploads/2017/07/hinh-nen-songoku-dep-nhat-cho-may-tinh-5.jpg",
                       "Vegito": "http://taigamemienphivedienthoai.info/wp-content/uploads/2017/07/hinh-nen-songoku-dep-nhat-cho-may-tinh-1.jpg"]
    static func HEROImageNamed(imageNamed: String?) -> URL? {
        guard let urlString = HERO[imageNamed ?? ""] else {
            return nil
        }
        return URL(string: urlString)
    }
}

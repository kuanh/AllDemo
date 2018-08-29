//
//  DemoURL.swift
//  DemoCassiniSplitView
//
//  Created by KuAnh on 10/11/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import Foundation

struct DemoURL {
    static let Standford = "https://cdn.spacetelescope.org/archives/images/large/heic1509a.jpg"
    static let HERO = ["Yasuo": "http://gamevnn.org/wp-content/uploads/2016/05/18-hinh-anh-lien-minh-huyen-thoai.jpg",
                       "Jinx": "http://gamevnn.org/wp-content/uploads/2016/05/73-hinh-anh-lien-minh-huyen-thoai.jpg",
                       "Ahri": "http://gamevnn.org/wp-content/uploads/2016/05/72-hinh-anh-lien-minh-huyen-thoai.jpg",
                       "Goku": "http://statis.infogame.vn/images/upload/2017/08/21/108_SAUQLebYG3_maxresdefault1.jpg?w=680"]
    
    static func HeroImageNamed(imageName: String?) -> URL? {
        guard let urlString = HERO[imageName ?? ""] else {
            return nil
        }
        return URL(string: urlString)
    }
}

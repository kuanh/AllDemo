//
//  PhotoInfo.swift
//  SplitPhotoScrollView
//
//  Created by KuAnh on 07/11/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

enum ListImage {
    case img1, img2, img3, img4, img5
}

class PhotoInfo: NSObject {
    var name: String
    var photo: ListImage
    
    init(name: String, photo: ListImage) {
        self.name = name
        self.photo = photo
    }
    
    func listPhoto() -> UIImage? {
        switch self.photo {
        case .img1:
            return UIImage(named: "img1")
        case .img2:
            return UIImage(named: "img2")
        case .img3:
            return UIImage(named: "img3")
        case .img4:
            return UIImage(named: "img4")
        case .img5:
            return UIImage(named: "img5")
        
        }
    }
}

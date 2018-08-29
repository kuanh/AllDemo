//
//  Student.swift
//  BaiTongKet5
//
//  Created by KuAnh on 03/11/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit
import os.log

class Student: NSObject, NSCoding {
    
    var name: String
    var year: Int
    var address: String
    var photo: UIImage?
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("students")
    
    struct PropertyKey {
        static let name = "name"
        static let year = "year"
        static let address = "address"
        static let photo = "photo"
    }
    
    init?(name: String, year: Int, address: String, photo: UIImage) {
        guard !name.isEmpty else {
            return nil
        }
        
        guard !address.isEmpty else {
            return nil
        }
        
        guard (year >= 1900) && (year <= 2017) else {
            return nil
        }
        
        self.name = name
        self.year = year
        self.address = address
        self.photo = photo
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(year, forKey: PropertyKey.year)
        aCoder.encode(address, forKey: PropertyKey.address)
        aCoder.encode(photo, forKey: PropertyKey.photo)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String ?? ""
        let year = aDecoder.decodeInteger(forKey: PropertyKey.year)
        let address = aDecoder.decodeObject(forKey: PropertyKey.address) as? String ?? ""
        let photo = aDecoder.decodeObject(forKey: PropertyKey.photo) as? UIImage ?? UIImage()
        self.init(name: name, year: year, address: address, photo: photo)
    }
}

//
//  ParsePlist.swift
//  DemoQuanLySinhVien
//
//  Created by KuAnh on 28/02/2018.
//  Copyright © 2018 KuAnh. All rights reserved.
//

import Foundation

class ParsePlist {
    func getDictionary(plist: String) -> Dictionary<AnyHashable, Any>? {
        var result: Dictionary<AnyHashable, Any>?
        let fileName = plist.components(separatedBy: ".")
        guard let filePath = Bundle.main.path(forResource: fileName.first ?? "", ofType: fileName.last ?? "") else { return nil }
        guard FileManager.default.fileExists(atPath: filePath) == true else {
            return nil
        }
        
        guard let plistData = FileManager.default.contents(atPath: filePath) else { return nil }
        do {
            guard let root = try PropertyListSerialization.propertyList(from: plistData, options: [], format: nil) as? Dictionary<AnyHashable, Any> else { return nil }
            result = root
        }catch {
            print("error")
        }
//        print("get \(plist): \n \(result)")
        return result
    }
}

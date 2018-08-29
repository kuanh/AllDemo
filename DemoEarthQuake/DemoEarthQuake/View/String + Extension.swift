//
//  Extension.swift
//  DemoEarthQuake
//
//  Created by KuAnh on 04/06/2018.
//  Copyright © 2018 KuAnh. All rights reserved.
//

import Foundation

extension String {
    func convertString() -> (range: String, location: String) {
        var range = "NEAR THE"
        var location = self
        if self.contains("of") {
            let index = (self.range(of: "of")?.upperBound)!
            range = String(self.prefix(upTo: index)).uppercased()
            location = String(self.suffix(from: index))
        }
        return (range, location)
    }
}

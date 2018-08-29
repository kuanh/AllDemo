//
//  MessageContent.swift
//  DemoSplitViewController
//
//  Created by KuAnh on 05/11/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class MessageContent: NSObject {
    var content: String
    
//    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
//    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("contentMessage")
    
    init(content: String) {
        self.content = content
    }
}

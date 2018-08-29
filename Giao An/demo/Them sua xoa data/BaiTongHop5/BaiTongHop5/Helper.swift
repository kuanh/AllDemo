//
//  File.swift
//  BaiTongHop5
//
//  Created by KuAnh on 27/10/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class Helper {
    func showAlert(title: String, message: String, fromController controller: UIViewController, preferredStyle: UIAlertControllerStyle) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {(action) -> Void in}))
        controller.present(alert, animated: true, completion: nil)
    }
}

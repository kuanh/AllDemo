//
//  Helper.swift
//  EditDelAddData
//
//  Created by KuAnh on 19/10/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

//extension UIViewController {
//    func showAlertVC(title: String, message: String) {
//        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(action) -> Void in
//            alert.dismiss(animated: true, completion: nil)
//        }))
//        self.present(alert, animated: true, completion: nil)
//
//    }
//
//}

class Helper {
    func showAlertVC(title: String, message: String, fromController controller: UIViewController, preferredStyle: UIAlertControllerStyle) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(action) -> Void in
            alert.dismiss(animated: true, completion: nil)
        }))
        controller.present(alert, animated: true, completion: nil)
        
    }
    
}

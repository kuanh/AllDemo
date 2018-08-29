//
//  ViewController.swift
//  DemoKeyboardResize
//
//  Created by KuAnh on 25/05/2018.
//  Copyright © 2018 KuAnh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tvContent: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        keyBoardResize()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func keyBoardResize() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShowForResizing),name:NSNotification.Name.UIKeyboardWillShow, object: self.view.window)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHideForResizing),name:NSNotification.Name.UIKeyboardWillHide, object: self.view.window)
    }
    @objc func keyboardWillShowForResizing(notification: Notification) {
         let userInfo = notification.userInfo!
        if let keyboardSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue, let window = self.view.window?.frame {
            self.view.frame = CGRect(x: self.view.frame.origin.x, y: self.view.frame.origin.y, width: self.view.frame.width, height: (window.origin.y + window.height - keyboardSize.height))
        }
//        else {
//            self.view.frame = CGRect(x: self.view.frame.origin.x, y: self.view.frame.origin.y, width: self.view.frame.width, height: self.view.frame.height)
//        }
    }
    
    @objc func keyboardWillHideForResizing(notification: Notification) {
        let userInfo = notification.userInfo!
        if let keyboardSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            
            let viewHeight = self.view.frame.height
            self.view.frame = CGRect(x: self.view.frame.origin.x, y: self.view.frame.origin.y, width: self.view.frame.width, height: viewHeight + keyboardSize.height)
        }
    }


}


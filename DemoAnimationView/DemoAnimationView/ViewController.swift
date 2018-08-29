//
//  ViewController.swift
//  DemoAnimationView
//
//  Created by KuAnh on 18/05/2018.
//  Copyright © 2018 KuAnh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer = Timer()
    var colours = UIColor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getRandomColor()
        timerF()
        
        UIView.animate(withDuration: 2, delay: 1.0, options:[UIViewAnimationOptions.repeat, UIViewAnimationOptions.autoreverse], animations: {
                        self.view.backgroundColor = self.colours
            
                    }, completion:nil)
    }
    
        func timerF(){
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(getRandomColor), userInfo: nil, repeats: true)
        }
    
        @objc func getRandomColor(){
            let red   = CGFloat((arc4random() % 256)) / 255.0
            let green = CGFloat((arc4random() % 256)) / 255.0
            let blue  = CGFloat((arc4random() % 256)) / 255.0
            let alpha = CGFloat(1.0)
            colours = UIColor(displayP3Red: red, green: green, blue: blue, alpha: alpha)
        }


}


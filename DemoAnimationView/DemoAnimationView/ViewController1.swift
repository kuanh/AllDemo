//
//  ViewController1.swift
//  DemoAnimationView
//
//  Created by KuAnh on 18/05/2018.
//  Copyright © 2018 KuAnh. All rights reserved.
//

import UIKit

class ViewController1: UIViewController {

    @IBOutlet weak var myView: UIView!
    var water:UIImageView!
    
    var hover:CABasicAnimation!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        water = UIImageView(image: UIImage(named: "goku"))
        water.frame = CGRect(x: 0, y: 0, width: 375.0, height: 666.0)
        
        water.contentMode = .scaleAspectFill
        
        UIView.animate(withDuration: 9.0, delay: 2.0, options: UIViewAnimationOptions.curveLinear, animations: {
            self.water.frame.origin.x = self.view.bounds.width + self.water.frame.width
            
        }, completion: nil)
        
        self.view.insertSubview(water, aboveSubview: myView)
    }

}

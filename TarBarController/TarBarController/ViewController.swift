//
//  ViewController.swift
//  TarBarController
//
//  Created by KuAnh on 23/05/2018.
//  Copyright © 2018 KuAnh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbName: UILabel!
    var myOrder = OrderModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tbc = tabBarController as! TabViewController
        myOrder = tbc.myOrder
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func saveBt(_ sender: UIButton) {
        myOrder.pie = (sender.titleLabel?.text)!
        lbName.text = myOrder.currentOrder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        lbName.text = myOrder.currentOrder()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}


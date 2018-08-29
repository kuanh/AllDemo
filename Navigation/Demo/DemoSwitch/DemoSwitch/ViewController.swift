//
//  ViewController.swift
//  DemoSwitch
//
//  Created by KuAnh on 12/10/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var switchButton: UISwitch!
    @IBOutlet weak var lblName: UILabel!
    var number = [1, 2, 3]
    var name = ["Mot", "Hai", "Ba"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func clickOnOff(_ sender: UISwitch) {
        if switchButton.isOn {
            lblName.text = "\(number)"
        } else {
            lblName.text = "\(name)"
        }
    }
    

}


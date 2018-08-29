//
//  ViewController.swift
//  TestUnwidSegue
//
//  Created by KuAnh on 05/10/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtLabel: UILabel?
    @IBOutlet weak var saveBT: UIButton!
    
    var txtNameLB: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        txtLabel?.text = txtNameLB
    }
    
//    @IBAction func unwindToLabelVC(sender: UIStoryboardSegue) {
//        if sender.identifier == "ShowName" {
//            let labelViewController = sender.source as! LabelViewController
//            txtLabel?.text = txtNameLB
//            
//            print("\(labelViewController.txtname?.text ?? "")")
//        }
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


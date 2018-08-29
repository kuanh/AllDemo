//
//  ViewController.swift
//  DemoSegue2VC
//
//  Created by KuAnh on 05/10/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var saveBT: UIButton!
    @IBOutlet weak var txtName: UITextField?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
//    @IBAction func unwinToViewController(unwindSegue: UIStoryboardSegue) {
//        if unwindSegue.identifier == "ShowName" {
//            let labelViewController = unwindSegue.source as! LabelViewController
//            print("\(labelViewController.txtLabel?.text ?? "")")
//        }
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddName" {
            let labelViewController = segue.destination as! LabelViewController
            labelViewController.txtNameLB = txtName?.text ?? ""
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


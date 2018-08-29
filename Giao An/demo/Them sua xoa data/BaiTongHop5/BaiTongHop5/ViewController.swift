//
//  ViewController.swift
//  BaiTongHop5
//
//  Created by KuAnh on 27/10/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var txtNumber: UITextField!
    var number: Int?
    var editNumber: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if number == nil {
            txtNumber.text = ""
        } else {
            txtNumber.text = "\(number!)"
        }
        txtNumber.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "saveNumber" {
            editNumber = txtNumber.text
        }
     }
    


}


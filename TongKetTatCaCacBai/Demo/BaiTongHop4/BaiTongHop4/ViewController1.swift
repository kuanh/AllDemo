//
//  ViewController1.swift
//  BaiTongHop4
//
//  Created by KuAnh on 26/10/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class ViewController1: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtNumber: UITextField!
    var number: Int?
    var editNumber: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if number == nil {
            txtNumber.text = String(describing: number ?? 0)
        } else {
            txtNumber.text = String(describing: number!)
        }
        txtNumber.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "saveNumber" {
            editNumber = txtNumber.text
        }
        
    }
 

}

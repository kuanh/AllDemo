//
//  ViewController2.swift
//  BaiTongHop4
//
//  Created by KuAnh on 26/10/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class ViewController2: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtString: UITextField!
    
    var textString: String?
    var editString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if textString == nil {
            txtString.text = textString ?? ""
        } else {
            txtString.text = textString!
        }
        txtString.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "saveString" {
            editString = txtString.text
        }
    }
    
}

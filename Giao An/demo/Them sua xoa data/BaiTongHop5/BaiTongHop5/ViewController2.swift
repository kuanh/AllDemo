//
//  ViewController2.swift
//  BaiTongHop5
//
//  Created by KuAnh on 27/10/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var txtTextString: UITextField!
    
    var textString: String?
    var editTextString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if textString == nil {
            txtTextString.text = textString ?? ""
        } else {
            txtTextString.text = textString!
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "saveString" {
            editTextString = txtTextString.text
        }
    }
 

}

//
//  LabelViewController.swift
//  DemoAppJunkClean
//
//  Created by KuAnh on 05/10/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class LabelViewController: UIViewController {
    
    @IBOutlet weak var lblName: UILabel?
    var textNameVC: String?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        lblName?.text = textNameVC
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

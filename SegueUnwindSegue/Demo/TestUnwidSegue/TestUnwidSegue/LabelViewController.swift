//
//  LabelViewController.swift
//  TestUnwidSegue
//
//  Created by KuAnh on 05/10/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class LabelViewController: UIViewController {

    @IBOutlet weak var saveBT: UIButton!
    @IBOutlet weak var txtname: UITextField?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddName" {
            let viewController = segue.destination as! ViewController
            viewController.txtNameLB = txtname?.text ?? ""
        }
    }
 

}

//
//  ViewController.swift
//  DirectDataTransfer
//
//  Created by KuAnh on 17/10/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc1 = segue.destination as? ViewController1
        vc1?.viewController = self
    }
}

class ViewController1: UIViewController {
    
    @IBOutlet weak var txtName: UITextField!
    var viewController: ViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        txtName.text = viewController?.lblName.text
    }
    @IBAction func btSaveDuLieu(_ sender: UIButton) {
        viewController?.lblName.text = txtName.text
        self.navigationController?.popViewController(animated: true)
    }
}


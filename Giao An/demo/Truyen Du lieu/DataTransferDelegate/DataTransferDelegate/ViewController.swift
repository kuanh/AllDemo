//
//  ViewController.swift
//  DataTransferDelegate
//
//  Created by KuAnh on 18/10/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, MyDelegate {
    

    @IBOutlet weak var lblText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dataChange(data: String) {
        lblText.text = data
    }
    
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "textChange" {
            let vc2 = segue.destination as? ViewController2
            vc2?.myDelegate = self
        }
    }

}

protocol MyDelegate {
    func dataChange(data: String)
}

class ViewController2: UIViewController {
    
    @IBOutlet weak var txtText: UITextField!
    var myDelegate: MyDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func btSendDataToVC(_ sender: UIButton) {
        let data = txtText.text ?? ""
        myDelegate?.dataChange(data: data)
        dismiss(animated: true, completion: nil)
    }
    
}


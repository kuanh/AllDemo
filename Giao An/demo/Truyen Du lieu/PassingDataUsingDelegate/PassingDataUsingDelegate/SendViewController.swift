//
//  SendViewController.swift
//  PassingDataUsingDelegate
//
//  Created by KuAnh on 17/10/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

protocol DataSendDelegate {
    func sendData(data: String)
}

class SendViewController: UIViewController {

    @IBOutlet weak var txtData: UITextField!
    
    var delegate: DataSendDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backwardsVC(_ sender: Any) {
        if delegate != nil {
            if txtData.text != nil {
                let data = txtData.text
                delegate?.sendData(data: data!)
                dismiss(animated: true, completion: nil)
            }
        }
    }
    
}

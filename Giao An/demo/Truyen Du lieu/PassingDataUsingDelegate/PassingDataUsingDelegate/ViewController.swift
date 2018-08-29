//
//  ViewController.swift
//  PassingDataUsingDelegate
//
//  Created by KuAnh on 17/10/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, DataSendDelegate {
    
    @IBOutlet weak var lblData: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func sendData(data: String) {
        lblData.text = data
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSendVC" {
            let sendVC = segue.destination as? SendViewController
            sendVC?.delegate = self
        }
    }


}


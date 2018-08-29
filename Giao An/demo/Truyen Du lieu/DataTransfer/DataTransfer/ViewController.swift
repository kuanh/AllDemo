//
//  ViewController.swift
//  DataTransfer
//
//  Created by KuAnh on 17/10/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, Delegate {
    
    @IBOutlet weak var lblData: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func onPizzaReady(type: String)
    {
        lblData.text = type
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sendSpySegue" {
            let vc2 = segue.destination as? ViewController2
            vc2?.delegate = self
            
        }
    }
}

protocol Delegate
{
    func onPizzaReady(type: String)
}

class ViewController2: UIViewController {
    
    @IBOutlet weak var txtName: UITextField!
    var delegate: Delegate?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func backwardsVC(_ sender: UIButton) {
        delegate?.onPizzaReady(type: txtName.text ?? "")
        self.navigationController?.popViewController(animated: true)
    }
}

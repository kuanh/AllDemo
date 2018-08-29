//
//  ViewController.swift
//  TonghopBa
//
//  Created by KuAnh on 25/10/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var viewNumber: UIView!
    @IBOutlet weak var viewString: UIView!
    @IBOutlet weak var txtNumber: UITextField!
    @IBOutlet weak var txtNumberString: UITextField?
    
    var number: Int?
    var editNumber: String?
    
    var numberString: String?
    var editNumberString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if number == nil {
            txtNumber.text = String(describing: number ?? 0)
        } else {
            txtNumber.text = String(describing: number!)
        }
        
        if numberString == nil {
            txtNumberString?.text = String(describing: numberString ?? "")
        } else {
            txtNumberString?.text = String(describing: numberString!)
        }
        
        txtNumber.delegate = self
        txtNumberString?.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
        
        let isPresenting = presentingViewController is UINavigationController
        if isPresenting {
            dismiss(animated: true, completion: nil)
            
        } else if let owiningNavigationController = navigationController {
            owiningNavigationController.popViewController(animated: true)
        } else {
            print("Hello!")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch (segue.identifier ?? "") {
//        case "AddTextString":
//            editNumber = txtNumber.text
//            editNumberString = (txtNumberString?.text)!
        case "SaveTextString":
            editNumber = txtNumber.text
            editNumberString = txtNumberString?.text
        default:
            print("\(segue.destination)")
        }
    }
}


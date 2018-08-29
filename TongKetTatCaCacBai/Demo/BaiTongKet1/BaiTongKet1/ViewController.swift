//
//  ViewController.swift
//  BaiTongKet1
//
//  Created by KuAnh on 14/10/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtNumber: UITextField!
    @IBOutlet weak var txtNumberString: UITextField!
    
    var number: Int?
    var numberString: String?
    var editNumberString: String?
    var editNumber: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if number == nil{
            txtNumber.text = "\(number ?? 0)"
            txtNumberString.text = numberString ?? ""
        } else {
            txtNumber.text = "\(number!)"
            txtNumberString.text = numberString
        }
    }
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
        
        let isPresenting = presentingViewController is UINavigationController
        
        if isPresenting {
            dismiss(animated: true, completion: nil)
        } else if let owningNavigationController = navigationController {
            owningNavigationController.popViewController(animated: true)
        } else {
            print("Hello!")
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txtNumber.resignFirstResponder()
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch (segue.identifier ?? "") {
        case "AddNewItems":
            editNumber = txtNumber.text
            editNumberString = txtNumberString.text
        case "SaveNumber":
            editNumber = txtNumber.text
            editNumberString = txtNumberString.text
        default:
            print("\(segue.destination)")
        }
    }


}


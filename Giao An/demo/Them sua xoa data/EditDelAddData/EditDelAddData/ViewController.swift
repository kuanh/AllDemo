//
//  ViewController.swift
//  EditDelAddData
//
//  Created by KuAnh on 18/10/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtSubTitle: UITextField!
    
    var number: Int?
    var editNumber: String?
    
    var textString: String?
    var editTextString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if number == nil {
            txtTitle.text = "\(number ?? 0)"
            txtSubTitle.text = textString ?? ""
        } else {
            txtTitle.text = "\(number!)"
            txtSubTitle.text = textString
        }
        txtTitle.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier ?? "" {
        case "addText":
            editNumber = txtTitle.text
            editTextString = txtSubTitle.text
        case "saveText":
            editNumber = txtTitle.text
            editTextString = txtSubTitle.text
        default:
            print("Hello")
        }
    }
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        let isPresenting = presentingViewController is UINavigationController
        
        if isPresenting {
            dismiss(animated: true, completion: nil)
        } else if let owningNavigationController = navigationController {
            owningNavigationController.popViewController(animated: true)
        } else {
            print("Hello!")
        }
    }


}


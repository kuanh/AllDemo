//
//  ViewController.swift
//  DemoPickerView
//
//  Created by KuAnh on 27/10/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var btAge: UIButton!
    @IBOutlet weak var viewShowAge: UIView!
    @IBOutlet weak var pickerViewAge: UIPickerView!
    
    var myPickerView = MyPickerView()
    
    var editAge: String?
    
    var selectedAge = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        pickerViewAge.dataSource = myPickerView
        pickerViewAge.delegate = myPickerView
        btAge.setTitle(myPickerView.selectedNumberString, for: .selected)
        btAge.isSelected = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func clickToSelectedAge(_ sender: UIButton) {
        if (selectedAge) {
            viewShowAge.isHidden = false
        } else {
            viewShowAge.isHidden = true
        }
        selectedAge = !selectedAge
    }
    
}


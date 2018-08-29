//
//  ViewController.swift
//  RadioButtonDemo
//
//  Created by KuAnh on 16/10/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var numberView: UIView!
    @IBOutlet weak var numberPicker: UIPickerView!
    @IBOutlet weak var btSelectNumber: UIButton!
    
//    var number = [Int](0...10)
    var selectedPicker = true
    var myData = MyDataPickerView()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        numberPicker.delegate = myData
        numberPicker.dataSource = myData
        btSelectNumber.setTitle(myData.selectedNumberPicker, for: .selected)
        btSelectNumber.isSelected = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func clickSelected(_ sender: UIButton) {
        if (selectedPicker) {
            numberView.isHidden = false
        } else {
            numberView.isHidden = true
        }
        selectedPicker = !selectedPicker
    }
    
    @IBAction func onClickButton(sender: UIButton) {
        buttons.forEach { $0.isSelected = false
            
            sender.setTitleColor(UIColor.black, for: .selected)
        }
        sender.isSelected = true
        sender.setTitleColor(UIColor.black, for: .selected)
    }
    
    

}


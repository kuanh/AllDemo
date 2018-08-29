//
//  ViewController.swift
//  BaiTongKet2
//
//  Created by KuAnh on 16/10/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var viewShowNumber: UIView!
    @IBOutlet weak var numberPicker: UIPickerView!
    @IBOutlet weak var txtNumber: UITextField!
    @IBOutlet weak var btNumberString: UIButton!
    
    var numberStringBT = ["----------","Muoi Mot","Mot Tram","Hai Tram","Ba Muoi", "Nam Muoi", "Hai", "Khong"]
    var selectedNumberString: String?
    
    var number: Int?
    var editNumber: String?
    
    var numberString: String?
    var editNumberString: String?
    
    var selectedNumber = true
//    var myDataPicker = MyDataPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if number == nil {
            txtNumber.text = "\(number ?? 0)"
            let numString = numberString ?? ""
            btNumberString.setTitle(numString, for: .selected)
            
        } else {
            txtNumber.text = "\(number!)"
            let numString = numberString!
            btNumberString.setTitle(numString, for: .selected)
        }
        txtNumber.delegate = self
        numberPicker.delegate = self
        numberPicker.dataSource = self
    }

    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
        
        let isPresenting = presentingViewController is UINavigationController
        if isPresenting {
            dismiss(animated: true, completion: nil)
            
        } else if let owningNavigatiobController = navigationController {
            owningNavigatiobController.popViewController(animated: true)
        } else {
            print("hello!")
        }
    }
    
    @IBAction func clickShowNumberString(_ sender: UIButton) {
        if (selectedNumber) {
            viewShowNumber.isHidden = false
        } else {
            viewShowNumber.isHidden = true
        }
        selectedNumber = !selectedNumber
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
        case "AddNewNumber":
            editNumber = txtNumber.text
            editNumberString = selectedNumberString
        case "SaveNumber":
            editNumber = txtNumber.text
            editNumberString = selectedNumberString
            
        default:
            print("\(segue.destination)")
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numberStringBT.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return numberStringBT[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedNumberString  = numberStringBT[row]
        btNumberString.setTitle(selectedNumberString, for: .selected)
        btNumberString.isSelected = true
    }


}


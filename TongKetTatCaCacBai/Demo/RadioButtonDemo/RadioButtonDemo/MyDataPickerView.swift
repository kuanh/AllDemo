//
//  MyDataPickerView.swift
//  RadioButtonDemo
//
//  Created by KuAnh on 16/10/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class MyDataPickerView: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var number = [Int](0...10)
    var selectedNumberPicker: String?
//    var btButtonPicker: UIButton!
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return number.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(number[row])"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedNumberPicker = "\(number[row])"
//        btButtonPicker.setTitle(selectedNumberPicker, for: .selected)
//        btButtonPicker.isSelected = true
    }
    
    
}

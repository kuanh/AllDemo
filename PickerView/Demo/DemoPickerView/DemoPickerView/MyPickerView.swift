//
//  MyPickerView.swift
//  DemoPickerView
//
//  Created by KuAnh on 27/10/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class MyPickerView: NSObject, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var arrayAge = [Int](1...100)
    var selectedNumberString: String?
    var btSelectedAge : UIButton!
        
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayAge.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(arrayAge[row])"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        btSelectedAge = UIButton()
        selectedNumberString  = "\(arrayAge[row])"
        btSelectedAge.setTitle(selectedNumberString, for: .selected)
        btSelectedAge.isSelected = true
    }
}

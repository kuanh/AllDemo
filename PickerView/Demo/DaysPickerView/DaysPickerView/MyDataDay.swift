//
//  MyDataDay.swift
//  DaysPickerView
//
//  Created by KuAnh on 16/10/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class MyDataDay: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
    var numberString = ["----------","Muoi Mot","Mot Tram","Hai Tram","Ba Muoi", "Nam Muoi", "Hai", "Khong"]
    
    var selectedNumberString: String?
    var btSelectedNumber: UIButton!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numberString.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return numberString[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedNumberString  = numberString[row]
        btSelectedNumber.setTitle(selectedNumberString, for: .selected)
        btSelectedNumber.isSelected = true
    }
}

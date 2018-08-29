//
//  ButtonViewController.swift
//  DaysPickerView
//
//  Created by KuAnh on 11/10/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class ButtonViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var btHideShow: UIButton!
    @IBOutlet weak var bottomShow: NSLayoutConstraint!
    @IBOutlet weak var viewShowPicker: UIView!
    @IBOutlet weak var numberPicker: UIPickerView!
    
    var selectedButton = true
    var btNumber: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberPicker.delegate = self
        numberPicker.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickHideShow(_ sender: UIButton) {
        if (selectedButton) {
            viewShowPicker.isHidden = false
        } else {
            viewShowPicker.isHidden = true
        }
        selectedButton = !selectedButton
    }
    
    var numberString = ["----------","Muoi Mot","Mot Tram","Hai Tram","Ba Muoi", "Nam Muoi", "Hai", "Khong"]
    
    var selectedNumberString: String?
    
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
        btHideShow.setTitle(selectedNumberString, for: .selected)
        btHideShow.isSelected = true
    }

}

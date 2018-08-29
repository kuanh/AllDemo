//
//  ViewController.swift
//  DaysPickerView
//
//  Created by KuAnh on 11/10/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    

    @IBOutlet weak var viewDays: UIView!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var btHideShow: UIButton!
    @IBOutlet weak var dayPicker: UIPickerView!
    
    var days = ["----------","Monday","Tuesday","Wednesday","Thursday", "Friday", "Saturday", "Sunday"]
    var selectedPicker = true
    var selectedDayPicker: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        dayPicker.delegate = self
        dayPicker.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickHideShow(_ sender: UIButton) {
        if (selectedPicker) {
            viewDays.isHidden = false
        } else {
            viewDays.isHidden = true
        }
        selectedPicker = !selectedPicker
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return days.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return days[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedDayPicker = days[row]
        self.btHideShow.setTitle(selectedDayPicker, for: .selected)
        self.btHideShow.isSelected = true
    }
    

}


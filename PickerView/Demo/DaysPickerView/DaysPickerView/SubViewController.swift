//
//  SubViewController.swift
//  DaysPickerView
//
//  Created by KuAnh on 11/10/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class SubViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
   
    @IBOutlet var viewPickerDay: UIView!
    @IBOutlet weak var daysPicker: UIPickerView!
    var days = ["Monday","Tuesday","Wednesday","Thussday", "Friday", "Saturday", "Sunday"]
    var selectedDays: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        daysPicker.delegate = self
        daysPicker.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        selectedDays = days[row]
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

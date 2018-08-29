//
//  ButtonPickerViewController.swift
//  DemoSegueAndPickerView
//
//  Created by KuAnh on 07/10/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class ButtonPickerViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var txtDay: UITextField!
    @IBOutlet weak var btButtonDay: UIButton!
    
    let days = ["Monday","Tuesday", "Wednesday", "Thussday", "Friday", "Saturday", "Sunday"]
    var selectedDay: String?
    var dayPicker = UIPickerView()
    var active_textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtDay.delegate = self
        dayPicker.delegate = self
        dayPicker.dataSource = self
        
        txtDay.inputView = dayPicker
//        create_toolbar()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func selectedDayButton(_ sender: UITextField) {
         sender.inputView = dayPicker
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

extension ButtonPickerViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
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
        selectedDay = days[row]
        btButtonDay.titleLabel?.text = selectedDay
        txtDay.text = selectedDay
    }
    
//    func create_toolbar() {
//        let toolbar = UIToolbar()
//        toolbar.barStyle = .default
//        toolbar.sizeToFit()
//        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneClick))
//        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
//        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelClick))
//        toolbar.setItems([doneButton, spaceButton, cancelButton], animated: false)
//        txtDay.inputAccessoryView = toolbar
//
//    }
//
//    @objc func doneClick() {
//        active_textField.resignFirstResponder()
//    }
//
//    @objc func cancelClick() {
//        active_textField.text = ""
//        active_textField.resignFirstResponder()
//    }
}

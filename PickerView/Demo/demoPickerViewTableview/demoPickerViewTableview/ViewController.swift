//
//  ViewController.swift
//  demoPickerViewTableview
//
//  Created by KuAnh on 05/11/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var viewShowPickerView: UIView!
    @IBOutlet weak var pickerViewShowData: UIPickerView!
    @IBOutlet weak var btSelected: UIButton!
    
    var selected = true
    var editData: String?
    var numberString = ["----------","Muoi Mot","Mot Tram","Hai Tram","Ba Muoi", "Nam Muoi", "Hai", "Khong"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerViewShowData.dataSource = self
        pickerViewShowData.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func clickHideShow(_ sender: UIButton) {
        if (selected) {
            viewShowPickerView.isHidden = false
        } else {
            viewShowPickerView.isHidden = true
        }
        selected = !selected
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
    }
    
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
        editData = numberString[row]
        btSelected.setTitle(editData, for: .selected)
        btSelected.isSelected = true
    }
    
}


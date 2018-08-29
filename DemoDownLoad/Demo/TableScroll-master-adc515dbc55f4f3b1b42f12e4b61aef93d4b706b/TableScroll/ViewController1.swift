//
//  ViewController1.swift
//  TableScroll
//
//  Created by KuAnh on 15/03/2018.
//  Copyright © 2018 VINEETKS. All rights reserved.
//

import UIKit

class ViewController1: UIViewController {

    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var tableHeight: NSLayoutConstraint!
    
    @IBOutlet weak var pickerHeight: NSLayoutConstraint!
    var arrayPicker = [Int](0...50)
    var loop = 40
    var arrayString = ["huy","anh","cong","123"] 
    
    override func viewDidLoad() {
        tableHeight.constant = self.view.frame.height - 208
        self.tableview.isScrollEnabled = false
        self.scrollview.bounces = false
        self.tableview.bounces = true
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        if scrollView == self.scrollview {
            tableview.isScrollEnabled = (self.scrollview.contentOffset.y >= 44)
            pickerHeight.constant = 200
        }
        if scrollView == self.tableview {
            self.tableview.isScrollEnabled = (self.scrollview.contentOffset.y > 0)
            pickerHeight.constant = 250
        }
    }

}

extension ViewController1: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayPicker.count * loop
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(arrayPicker[row % arrayPicker.count])"
    }
    
    
}

extension ViewController1: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayString.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row > arrayString.count - 1 {
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
            return cell1
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = arrayString[indexPath.row]
            return cell
        }
    }
    
    
}

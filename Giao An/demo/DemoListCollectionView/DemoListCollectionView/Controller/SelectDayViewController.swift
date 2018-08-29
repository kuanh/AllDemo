//
//  SelectDayViewController.swift
//  DemoListCollectionView
//
//  Created by KuAnh on 07/03/2018.
//  Copyright © 2018 KuAnh. All rights reserved.
//

import UIKit

struct CellId {
    static let DaysCell = "cell"
    static let ResetCell = "cell1"
    static let TreeCell = "cell2"
}

class SelectDayViewController: UIViewController {

        @IBOutlet weak var datePickerView: UIPickerView!
    @IBOutlet weak var selectDayTableView: UITableView!
    
    var arrayTime = [Int](1...150)
    var dayOfWeek = ["Thứ 2", "Thứ 3", "Thứ 4", "Thứ 5", "Thứ 6", "Thứ 7", "CN"]
    var looping = 40
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

extension SelectDayViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayTime.count * looping
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(arrayTime[row % arrayTime.count])"
    }
    
}

extension SelectDayViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
        let cell2 = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)
        cell.detailTextLabel?.text = dayOfWeek[indexPath.row]
        cell
        return cell
    }
    
    
}


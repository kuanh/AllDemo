//
//  NumberTableViewController.swift
//  BaiTongKet2
//
//  Created by KuAnh on 16/10/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit
import os.log

class NumberTableViewController: UITableViewController {
    
    @IBOutlet weak var switchBT: UISwitch! 
    
    var myDataNumber = MyData()
    var myDataNumberString = MyDataString()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = myDataNumber

    }
    @IBAction func clickOnOff(sender: UISwitch) {
        if sender.isOn {
            tableView.dataSource = myDataNumber
        } else {
            tableView.dataSource = myDataNumberString
        }
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch (segue.identifier ?? "") {
        case "AddNewNumber":
            os_log("Adding new Number.", log: OSLog.default, type: .debug)
        case "EdittNumber":
            let numVC = segue.destination as! ViewController
            let indexPath = tableView.indexPathForSelectedRow!
            numVC.number = indexPath.row
            numVC.numberString = "\(indexPath.row)"
        default:
            print("\(segue.destination)")
        }
    }
    
    @IBAction func unwindNumber(for unwindSegue: UIStoryboardSegue) {
//        var arrayNum = myDataNumber.arrayNumber
        if unwindSegue.identifier == "SaveNumber" {
            let numberVC = unwindSegue.source as! ViewController
            if tableView.indexPathForSelectedRow != nil {
                var dataNumber = myDataNumber.arrayNumber
                if dataNumber.isEmpty {
                    let index = numberVC.number
                    let array = numberVC.editNumber
                    dataNumber[index!] = Int(array!)!
                }
                var dataNumberString = myDataNumberString.arrayNumberString
                if dataNumberString.isEmpty {
                    let indexPath = numberVC.numberString
                    let arrayNumberString = numberVC.editNumberString
                    dataNumberString[Int(indexPath!)!] = arrayNumberString!
                    
                }
                tableView.reloadData()
            } else {
                let newIndexPath = IndexPath(row: myDataNumber.arrayNumber.count, section: 0)
                    let num = Int(numberVC.editNumber!)
                    myDataNumber.arrayNumber.append(num!)
                    tableView.insertRows(at: [newIndexPath], with: .automatic)
                
                let newIndexPathString = IndexPath(row: myDataNumberString.arrayNumberString.count, section: 0)
                    let numString = numberVC.editNumberString
                    myDataNumberString.arrayNumberString.append(numString!)
                    tableView.insertRows(at: [newIndexPathString], with: .automatic)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

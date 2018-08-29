//
//  ShowNumberTableViewController.swift
//  TonghopBa
//
//  Created by KuAnh on 25/10/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit
import os.log

class ShowNumberTableViewController: UITableViewController {
    
    @IBOutlet weak var switchBt: UISwitch!
    var myData1 = MyData1()
    var myData2 = MyData2()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = myData1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func ClickTransferNumberVSString(sender: UISwitch) {
        if sender.isOn {
            tableView.dataSource = myData1
        } else {
            tableView.dataSource = myData2
        }
        tableView.reloadData()
    }
    
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch (segue.identifier ?? "") {
        case "AddTextString":
            os_log("Add Number String or number", log: OSLog.default, type: .debug)
        case "EditTextString":
            let vc = segue.destination as! ViewController
            if switchBt.isOn {
                let indexPath = tableView.indexPathForSelectedRow!
                vc.number = myData1.number[indexPath.row]
            } else {
                let indexPath = tableView.indexPathForSelectedRow!
                vc.numberString = myData2.textString[indexPath.row]
            }
        default:
            print("\(segue.destination)")
        }
    }
 
    
    @IBAction func unwindFromVCToTableVC(for unwindSegue: UIStoryboardSegue) {
        if unwindSegue.identifier == "SaveTextString" {
            let vc = unwindSegue.source as! ViewController
            if switchBt.isOn {
                if tableView.indexPathForSelectedRow != nil {
                    let index = vc.number
                    let newElement = vc.editNumber
                    myData1.number[index!] = Int(newElement!)!
                    tableView.reloadData()
                } else {
                    let newIndexPath = IndexPath(row: myData1.number.count, section: 0)
                    myData1.number.append(Int((vc.editNumber)!)!)
                    tableView.insertRows(at: [newIndexPath], with: .automatic)
                }
            } else {
                if tableView.indexPathForSelectedRow != nil {
                    let indexString = tableView.indexPathForSelectedRow!
                    
                    let newElementString = vc.editNumberString
                    myData2.textString[indexString.row] = newElementString!
                    tableView.reloadData()
                } else {
                    let newIndexPathString = IndexPath(row: myData2.textString.count, section: 0)
                    myData2.textString.append((vc.editNumberString)!)
                    tableView.insertRows(at: [newIndexPathString], with: .automatic)
                }
            }
        }
    }

}

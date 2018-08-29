//
//  ShowTableViewController.swift
//  BaiTongHop4
//
//  Created by KuAnh on 26/10/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit
import os.log

class ShowTableViewController: UITableViewController {
    
    @IBOutlet var stringBt: UIBarButtonItem!
    @IBOutlet var numberBt: UIBarButtonItem!
    @IBOutlet weak var switchButton: UISwitch!
    var myData1 = MyData1()
    var myData2 = MyData2()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = myData1
        tableView.reloadData()
        self.navigationItem.rightBarButtonItem = numberBt
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickTransfer(sender: UISwitch) {
        if sender.isOn {
            tableView.dataSource = myData1
            self.navigationItem.rightBarButtonItem = numberBt
        } else {
            tableView.dataSource = myData2
            self.navigationItem.rightBarButtonItem = stringBt
        }
        tableView.reloadData()
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch (segue.identifier ?? "") {
        case "addNumber":
            os_log("Add New Number", log: OSLog.default, type: .debug)
        case "addString":
            os_log("Add New Text", log: OSLog.default, type: .debug)
        case "editNumber":
            let vc1 = segue.destination as! ViewController1
            let indexPath = tableView.indexPathForSelectedRow!
            vc1.number = myData1.number[indexPath.row]
        case "editString":
            let vc2 = segue.destination as! ViewController2
            let index = tableView.indexPathForSelectedRow!
            vc2.textString = myData2.numberString[index.row]
        default:
            print("hello!")
        }
    }
    
    @IBAction func unwindFromVC1ToTableVC(for unwindSegue: UIStoryboardSegue) {
        if unwindSegue.identifier == "saveNumber" {
            let vc1 = unwindSegue.source as! ViewController1
            if  tableView.indexPathForSelectedRow != nil {
                let index = tableView.indexPathForSelectedRow!
                let newIndex = vc1.editNumber
                myData1.number[index.row] = Int(newIndex!)!
            } else {
                let newIndex = IndexPath(row: myData1.number.count, section: 0)
                myData1.number.append(Int(vc1.editNumber!)!)
                tableView.insertRows(at: [newIndex], with: .automatic)
            }
            tableView.reloadData()
        }
    }
    
    @IBAction func unwindFromVC2ToTableVC(for unwindSegue: UIStoryboardSegue) {
        if unwindSegue.identifier == "saveString" {
            let vc2 = unwindSegue.source as! ViewController2
            if tableView.indexPathForSelectedRow != nil {
                let index = tableView.indexPathForSelectedRow!
                let newIndex = vc2.editString
                myData2.numberString[index.row] = newIndex!
            } else {
                let newIndex = IndexPath(row: myData2.numberString.count, section: 0)
                myData2.numberString.append(vc2.editString!)
                tableView.insertRows(at: [newIndex], with: .automatic)
            }
            tableView.reloadData()
        }
    }

}

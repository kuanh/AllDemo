//
//  DemoTableViewController.swift
//  BaiTongHop5
//
//  Created by KuAnh on 27/10/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit
import os.log

class DemoTableViewController: UITableViewController {

    @IBOutlet weak var switchBT: UISwitch!
    @IBOutlet var numberBt: UIBarButtonItem!
    @IBOutlet var stringBt: UIBarButtonItem!
    
    var myDataNumber = MyDataNumber()
    var myDataString = MyDataTextString()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = myDataNumber
        self.navigationItem.rightBarButtonItem = numberBt
        myDataNumber.vc = self
        myDataString.vc = self
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickChange(_ sender: UISwitch) {
        if sender.isOn {
            tableView.dataSource = myDataNumber
            self.navigationItem.rightBarButtonItem = numberBt
        } else {
            tableView.dataSource = myDataString
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
            os_log("Add New Text String", log: OSLog.default, type: .debug)
        case "editNumber":
            let vc = segue.destination as! ViewController
            let indexPath = tableView.indexPathForSelectedRow!
            vc.number = myDataNumber.number[indexPath.row]
        case "editString":
            let vc2 = segue.destination as! ViewController2
            let indexPath = tableView.indexPathForSelectedRow!
            vc2.textString = myDataString.nameArray[indexPath.row]
        default:
            print("\(segue.destination)")
        }
    }
    
    @IBAction func unwindFromVCToTableVC(for unwindSegue: UIStoryboardSegue) {
        if unwindSegue.identifier == "saveNumber" {
            let vc = unwindSegue.source as! ViewController
            if tableView.indexPathForSelectedRow != nil {
                let index = tableView.indexPathForSelectedRow!
                let newIndex = vc.editNumber
                myDataNumber.number[index.row] = Int(newIndex!)!
            } else {
                let newIndex = IndexPath(row: myDataNumber.number.count, section: 0)
                myDataNumber.number.append(Int(vc.editNumber!)!)
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
                let newIndex = vc2.editTextString
                myDataString.nameArray[index.row] = newIndex!
            } else {
                let newIndex = IndexPath(row: myDataString.nameArray.count, section: 0)
                myDataString.nameArray.append(vc2.editTextString!)
                tableView.insertRows(at: [newIndex], with: .automatic)
            }
            tableView.reloadData()
        }
    }

}

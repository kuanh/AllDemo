//
//  ShowDataTableViewController.swift
//  EditDelAddData
//
//  Created by KuAnh on 18/10/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit
import os.log

class ShowDataTableViewController: UITableViewController, UIAlertViewDelegate {
    
    var myData = MyDataShow()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = myData
        tableView.delegate = myData
        myData.vc = self
        self.navigationItem.leftBarButtonItem = editButtonItem
        tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch (segue.identifier ?? "") {
        case "addText":
            os_log("Adding new text", log: OSLog.default, type: .debug)
        case "editText":
            let numVC = segue.destination as! ViewController
            let indexPath = tableView.indexPathForSelectedRow!
            
            numVC.number = indexPath.row
            numVC.textString = "\(indexPath.row)"
            
        default:
            print("\(segue.destination)")
        }
    }
    
    @IBAction func unwindFromVCToShowTableVC(for unwindSegue: UIStoryboardSegue) {
        if unwindSegue.identifier == "saveText" {
            let numVC = unwindSegue.source as! ViewController
            if tableView.indexPathForSelectedRow != nil {
                
                let index = numVC.number
                let array = numVC.editNumber
                myData.arrayNumber[index!] = Int(array!)!
                
                let indexString = numVC.textString
                let arrayString = numVC.editTextString
                myData.arrayTextString[Int(indexString!)!] = arrayString!
                tableView.reloadData()
                
            } else {
                let newNumber = IndexPath(row: myData.arrayNumber.count, section: 0)
                
                let num = Int(numVC.editNumber!)
                myData.arrayNumber.append(num!)
                
                let textString = numVC.editTextString
                myData.arrayTextString.append(textString!)
                tableView.insertRows(at: [newNumber], with: .automatic)
            }
        }
    }
    

}

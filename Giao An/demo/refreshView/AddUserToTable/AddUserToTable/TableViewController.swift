//
//  TableViewController.swift
//  AddUserToTable
//
//  Created by Chris Upjohn on 20/01/2015.
//  Copyright (c) 2015 Chris Upjohn. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, UIAlertViewDelegate {
    
    var users: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        // Set the label text as the users name
        cell.textLabel!.text = users[indexPath.row]
        
        return cell
    }
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        if buttonIndex == 1 {
            users.append(alertView.textField(at: 0)?.text ?? "")
            tableView.reloadData()
        }
    }
    
    @IBAction func addUser(sender: AnyObject) {
        var alert = UIAlertView(title: "Enter users name", message: nil, delegate: self, cancelButtonTitle: "Cancel")
        alert.addButton(withTitle: "Done")
        alert.alertViewStyle = UIAlertViewStyle.plainTextInput
        users.append("\(alert.alertViewStyle)")
        alert.show()
    }
    
}


































//
//  SwitchTableViewController.swift
//  DemoSwitch
//
//  Created by KuAnh on 12/10/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class SwitchTableViewController: UITableViewController {

    @IBOutlet weak var swtichButton: UISwitch!
    var number = [1, 2, 3]
    var name = ["Mot", "Hai", "Ba"]
    var currentName: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        clickOnOff(swtichButton)
    }
    @IBAction func clickOnOff(_ sender: UISwitch) {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "123")
        if sender.isOn {
            var num:[String] = []
            
            for i in number {
                num.append("\(i)")
            }
            currentName = num
            
        } else {
            currentName = name
        }
        print(currentName)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return currentName.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "123", for: indexPath)
        cell.textLabel?.text = "\(currentName[indexPath.row])"
        return cell
    }
}

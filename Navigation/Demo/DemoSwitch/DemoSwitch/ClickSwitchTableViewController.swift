//
//  ClickSwitchTableViewController.swift
//  DemoSwitch
//
//  Created by KuAnh on 12/10/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class ClickSwitchTableViewController: UITableViewController {

    @IBOutlet weak var switchBT: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

class SwitchMethodTableView {
    private var number = [Int](0...10)
    private var numberString = ["Khong","Mot", "Hai", "Ba", "Bon", "Nam", "Sau", "Bay", "Tam", "Chin", "Muoi"]
    private var array: [String] = []
    
    func allNumberArray() -> [Int] {
        return number
    }
    
    func allNumberStringArray() -> [String] {
        return numberString
    }
    
    func allArray() -> [String] {
        return array
    }
}

extension ClickSwitchTableViewController {
    
    var dataStore: SwitchMethodTableView {
        return SwitchMethodTableView()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataStore.allNumberArray().count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "123", for: indexPath)
        let data = dataStore.allNumberArray()[indexPath.row]
        cell.textLabel?.text = "\(data)"
        return cell
    }
    
}

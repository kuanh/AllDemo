//
//  LoadMoreTableViewController.swift
//  ReloadMoreDemo
//
//  Created by KuAnh on 26/10/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class LoadMoreTableViewController: UITableViewController {
    
    var number = [Int](0...15)

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.tableView.separatorColor = UIColor.clear
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return number.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = "\(number[indexPath.row])"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let nextArrayNumber = number.count - 1
        if indexPath.row == nextArrayNumber {
            let lastItem = number.last!
            let newNumber = lastItem + 1
            number.append(newNumber)
            tableView.reloadData()
        }
        
        
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

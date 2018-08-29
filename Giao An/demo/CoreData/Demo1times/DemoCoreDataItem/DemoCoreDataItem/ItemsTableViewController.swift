//
//  ItemsTableViewController.swift
//  DemoCoreDataItem
//
//  Created by KuAnh on 04/12/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit
import os.log

class ItemsTableViewController: UITableViewController {
    
    let context = AppDelegate.shared.persistentContainer.viewContext
    var items:[Item] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchData()
    }
    
    func fetchData() {
        do {
            items = try context.fetch(Item.fetchRequest())
            print(items.count)
            self.tableView.reloadData()
        } catch {
            print("Couldn't Fetch Data")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) 

        cell.textLabel?.text = items[indexPath.row].name
        cell.detailTextLabel?.text = items[indexPath.row].id

        return cell
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            context.delete(items[indexPath.row])
            items.remove(at: indexPath.row)
            AppDelegate.shared.saveContext()
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
 
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch (segue.identifier ?? "") {
        case "addItem":
            os_log("Add New Item", log: OSLog.default, type: .debug)
        case "showItem":
            if let indexPath = tableView.indexPathForSelectedRow {
                let vc = segue.destination as! ViewController
                vc.listItems = items[indexPath.row]
            }
        default:
            print("error")
        }
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        if let vc = unwindSegue.source as? ViewController, let list = vc.listItems {
            if let indexPath = tableView.indexPathForSelectedRow {
                items[indexPath.row] = list
                tableView.reloadRows(at: [indexPath], with: .none)
            }
        }
    }
    
}

//
//  StudentTableViewController.swift
//  DemoCoreData
//
//  Created by KuAnh on 02/04/2018.
//  Copyright © 2018 KuAnh. All rights reserved.
//

import UIKit
import os.log

class StudentTableViewController: UITableViewController {
    
    let context = AppDelegate.share.persistenContainer.viewContext
    var arrayStd: [Student] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchData()
    }

    func fetchData() {
        do {
            arrayStd = try! context.fetch(Student.fetchRequest())
            self.tableView.reloadData()
        } catch {
            print("error")
        }
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayStd.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! StudentTableViewCell
        guard let image: UIImage = UIImage(data: arrayStd[indexPath.row].imageStd!) else { fatalError("loi data") }
        
        cell.lbName.text = arrayStd[indexPath.row].nameStd
        cell.lbAge.text = "\(arrayStd[indexPath.row].ageStd)"
        cell.imageOfStudent.image = image

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
            
            context.delete(arrayStd[indexPath.row])
            arrayStd.remove(at: indexPath.row)
            AppDelegate.share.saveContext()
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch (segue.identifier ?? "") {
        case "addNew":
            os_log("add new Student", log: OSLog.default, type: .debug)
        case "showInfo":
            if let indexPath = tableView.indexPathForSelectedRow {
                let vc = segue.destination as! ViewController
                vc.listStudents = arrayStd[indexPath.row]
            }
        default:
            print("error")
        }
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        if let vc = unwindSegue.source as? ViewController, let list = vc.listStudents {
            if let indexPath = tableView.indexPathForSelectedRow {
                arrayStd[indexPath.row] = list
                tableView.reloadRows(at: [indexPath], with: .automatic)
            }
        }
    }
    

}

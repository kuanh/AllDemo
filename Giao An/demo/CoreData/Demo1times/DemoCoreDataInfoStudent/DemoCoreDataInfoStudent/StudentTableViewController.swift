//
//  StudentTableViewController.swift
//  DemoCoreDataInfoStudent
//
//  Created by KuAnh on 03/05/2018.
//  Copyright © 2018 KuAnh. All rights reserved.
//

import UIKit
import os.log

class StudentTableViewController: UITableViewController {
    
    var context = AppDelegate.share.persistentContainer.viewContext
    var arrayStudent : [InfoStudent] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchData()
    }
    
    func fetchData() {
        do {
            arrayStudent = try context.fetch(InfoStudent.fetchRequest())
            self.tableView.reloadData()
        } catch {
            print("Couldn't fetch data.")
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayStudent.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! StudentTableViewCell

        guard let image = UIImage(data: arrayStudent[indexPath.row].imageStd!) else { fatalError("loi data") }
        
        cell.nameStudent.text = arrayStudent[indexPath.row].name
        cell.ageStudent.text = "\(arrayStudent[indexPath.row].age)"
        cell.addressStudent.text = arrayStudent[indexPath.row].address
        cell.photoStudent.image = image

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch (segue.identifier ?? "") {
        case "addNew":
            os_log("add new Student", log: OSLog.default, type: .debug)
        case "showInfo":
            if let indexPath = tableView.indexPathForSelectedRow {
                let vc = segue.destination as! ViewController
                vc.student = arrayStudent[indexPath.row]
            }
        default:
            print("error")
        }
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        if let vc = unwindSegue.source as? ViewController, let std = vc.student {
            if tableView.indexPathForSelectedRow != nil {
                let indexPath = tableView.indexPathForSelectedRow!
                let array = arrayStudent[indexPath.row]
                array.name = std.name
                array.age = std.age
                array.address = std.address
                array.imageStd = std.imageStd
                
                tableView.reloadRows(at: [indexPath], with: .none)
            } else {
                let newStudent = InfoStudent(context: context)
                newStudent.name = std.name
                newStudent.age = std.age
                newStudent.address = std.address
                newStudent.imageStd = std.imageStd
                
            }
            AppDelegate.share.saveContext()
            tableView.reloadData()
        }
    }
    

}

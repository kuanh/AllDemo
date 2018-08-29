//
//  StudentTableViewController.swift
//  DemoThemSuaXoa
//
//  Created by KuAnh on 28/03/2018.
//  Copyright © 2018 KuAnh. All rights reserved.
//

import UIKit
import os.log

class StudentTableViewController: UITableViewController {
    
    var students = [Student]()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }


    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return students.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! StudentTableViewCell

        cell.name.text = students[indexPath.row].name
        cell.age.text = "\(students[indexPath.row].age)"
        cell.photo.image = students[indexPath.row].photo

        return cell
    }
    
    private func loadData() {
        guard let std1 = Student(name: "Huy", age: 20, photo: UIImage(named: "h")) else {
            return
        }
        guard let std2 = Student(name: "Ngoc Anh", age: 24, photo: UIImage(named: "n")) else {
            return
        }
        
        students += [std1, std2]
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

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch (segue.identifier ?? "") {
        case "addStd":
            os_log("Adding new student", log: OSLog.default, type: .debug)
        case "showStd":
            let vc = segue.destination as! ViewController
            let index = tableView.indexPathForSelectedRow!
            vc.student = students[index.row]
        default:
            print("error")
        }
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        if unwindSegue.identifier == "saveStudent" {
            if let vc = unwindSegue.source as? ViewController, let student = vc.student {
                if tableView.indexPathForSelectedRow != nil {
                    let index = tableView.indexPathForSelectedRow!
                    students[index.row] = student
                } else {
                    let newIndex = IndexPath(row: students.count, section: 0)
                    students.append(student)
                    tableView.insertRows(at: [newIndex], with: .automatic)
                }
                tableView.reloadData()
            }
        }
    }
    

}

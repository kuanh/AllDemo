//
//  StudentTableViewController.swift
//  DemoCoreDataArray
//
//  Created by KuAnh on 04/12/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit
import CoreData
import os.log

class StudentTableViewController: UITableViewController {

    var viewController: ViewController?
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var people: [Students] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let newStudent = Students(context: context)
        
        newStudent.idStd = "1"
        newStudent.name = "anh"
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchData()
    }
    
    func fetchData(){
        do {
            people = try context.fetch(Students.fetchRequest())
            print(people)
            
            self.tableView.reloadData()
        } catch {
            print("error")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return people.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = people[indexPath.row].name
        cell.textLabel?.text = people[indexPath.row].idStd
        

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
        case "addStudent":
            os_log("Add new Student", log: OSLog.default, type: .debug)
        case "showData":
            if let indexPath = tableView.indexPathForSelectedRow {
                let vc = segue.destination as! ViewController
                vc.listStudents = people[indexPath.row]
            }
        default:
            fatalError("error")
        }
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        if let vc = unwindSegue.source as? ViewController, let student = vc.listStudents {
            let newIndexPath = IndexPath(row: people.count, section: 0)
            people.append(student)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
    

}

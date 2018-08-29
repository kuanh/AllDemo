//
//  EmployeeTableViewController.swift
//  DemoSaveImageToCoreData
//
//  Created by KuAnh on 10/12/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit
import os.log

class EmployeeTableViewController: UITableViewController {

    let context = AppDelegate.shared.persistentContainer.viewContext
    var arrayEmp: [Employee] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchData()
    }
    
    func fetchData() {
        do {
            arrayEmp = try context.fetch(Employee.fetchRequest())
            print(arrayEmp.count)
            self.tableView.reloadData()
        } catch  {
            print("Couldn't Fetch Data")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayEmp.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! EmployeeTableViewCell
        let emp = arrayEmp[indexPath.row]
        
        guard let image: UIImage = UIImage(data: emp.imageEmp!) else { fatalError("loi data") }
        cell.lbIdEmp.text = emp.idEmp
        cell.lbNameEmp.text = emp.nameEmp
        cell.imageEmp.image = image
        
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
            context.delete(arrayEmp[indexPath.row])
            arrayEmp.remove(at: indexPath.row)
            AppDelegate.shared.saveContext()
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    
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
        case "addNewEmloyee":
            os_log("Add new Employee", log: OSLog.default, type: .debug)
        case "showEmp":
            if let indexPath = tableView.indexPathForSelectedRow {
                let vc = segue.destination as? ViewController
                vc?.listEmployees = arrayEmp[indexPath.row]
            }
        default:
            print("error")
        }
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        if let vc = unwindSegue.source as? ViewController, let list = vc.listEmployees {
            if let indexPath = tableView.indexPathForSelectedRow {
                arrayEmp[indexPath.row] = list
                tableView.reloadRows(at: [indexPath], with: .none)
            }
        }
    }

}

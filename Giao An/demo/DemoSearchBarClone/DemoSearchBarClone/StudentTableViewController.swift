//
//  StudentTableViewController.swift
//  DemoSearchBar
//
//  Created by KuAnh on 30/03/2018.
//  Copyright © 2018 KuAnh. All rights reserved.
//

import UIKit
import os.log

class StudentTableViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var searchActive: Bool = false
    var students = [Student]()
    var listStudents: [Student] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
        searchBar.delegate = self
        if let saveStudents = loadStudents() {
            students += saveStudents
        }else {
            loadData()
        }
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        listStudents = students.filter({ (std) -> Bool in
            if std.name.lowercased().contains(searchBar.text!.lowercased()) || std.name.uppercased().contains(searchBar.text!.uppercased()) {
                return true
            }
            return false
        })
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if searchActive && searchBar.text != "" {
            return listStudents.count
        }
        return students.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! StudentTableViewCell
        let std: Student
        
        if searchActive && searchBar.text != "" {
            std = listStudents[indexPath.row]
        } else {
            std = students[indexPath.row]
        }
        cell.lbName.text = std.name
        cell.lbAge.text = "\(std.age)"
        cell.imageOfStudent.image = std.photo

        return cell
    }
    
    
    private func loadData() {
        guard let std1 = Student(name: "Cong Oc Cho", age: 24, photo: UIImage(named: "a1")) else { return }
        guard let std2 = Student(name: "Hoang Anh", age: 25, photo: UIImage(named: "a2")) else { return }
        guard let std3 = Student(name: "Huy", age: 22, photo: UIImage(named: "a3")) else { return }
        
        students += [std1, std2, std3]
    }

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            students.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            saveData()
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
        case "addNew":
            os_log("adding new student", log: OSLog.default, type: .debug)
        case "showStd":
            let vc = segue.destination as! ViewController
            let indexPath = tableView.indexPathForSelectedRow!
            let stdDetail: Student
            
            if searchActive && searchBar.text != "" {
                stdDetail = listStudents[indexPath.row]
            } else {
                stdDetail = students[indexPath.row]
            }
            vc.student = stdDetail
        default:
            print("\(String(describing: segue.identifier))")
        }
    }
    
    @IBAction func unwindFrom(for unwindSegue: UIStoryboardSegue) {
        if let vc = unwindSegue.source as? ViewController, let student = vc.student {
            if tableView.indexPathForSelectedRow != nil {
                let indexPath = tableView.indexPathForSelectedRow!
                students[indexPath.row] = student
            } else {
                let newIndexPath = IndexPath(row: students.count, section: 0)
                students.append(student)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
            saveData()
        }
    }
    
    private func saveData() {
        let isSuccessFully = NSKeyedArchiver.archiveRootObject(students, toFile: Student.ArchiveURL.path)
        if isSuccessFully {
            os_log("Student successfully save", log: OSLog.default, type: .debug)
        } else {
            os_log("Faile to save student", log: OSLog.default, type: .error)
        }
    }
    
    private func loadStudents() -> [Student]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Student.ArchiveURL.path) as? [Student]
    }

}

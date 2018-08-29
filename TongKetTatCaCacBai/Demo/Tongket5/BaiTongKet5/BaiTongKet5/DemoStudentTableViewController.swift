//
//  DemoStudentTableViewController.swift
//  BaiTongKet5
//
//  Created by KuAnh on 03/11/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit
import os.log

//enum selectedScope:Int {
//    case name = 0
//    case year = 1
//    case address = 2
//}

class DemoStudentTableViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchName: UISearchBar!
    @IBOutlet var reloadDataStudent: UITableView!
    
    var filltered = [Student]()
    var searchActivity: Bool = false
    
    var students = [Student]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
        searchName.delegate = self
        
        if let savedStudents = loadStudent() {
            students += savedStudents
        } else {
            loadSampleStudents()
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActivity = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActivity = false
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActivity = false
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filltered = students.filter({ (student) -> Bool in
            let year = "\(student.year)"
            if student.name.lowercased().contains(searchBar.text!.lowercased()) || student.address.lowercased().contains(searchBar.text!) || year.lowercased().contains(searchBar.text!) {
                return true
            } else {
                return false
            }
        })
        
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
        if searchActivity && searchName.text != "" {
            return filltered.count
        }
        return students.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? DemoStudentTableViewCell else {
            fatalError("The dequeue cell is not an instance of DemoTableViewCell.")
        }
        
        let student: Student
        if searchActivity && searchName.text != "" {
            student = filltered[indexPath.row]
        }else {
            student = students[indexPath.row]
            
        }
        
        cell.showName.text = student.name
        cell.showYear.text = "\(student.year)"
        cell.showAddress.text = student.address
        cell.showImageSelected.image = student.photo
        
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
            // Delete the row from the data source
            students.remove(at: indexPath.row)
            saveStudents()
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
        super.prepare(for: segue, sender: sender)
        switch (segue.identifier ?? "") {
        case "addStudent":
            os_log("Add New Student", log: OSLog.default, type: .debug)
        case "editStudent":
            guard let studentDetailViewController = segue.destination as? ViewController else {
                return
            }
            guard let studentCell = sender as? DemoStudentTableViewCell else {
                return
            }
            guard let indexPath = tableView.indexPath(for: studentCell) else {
                return
            }
            
            let studentDetail: Student
            if searchActivity && searchName.text != "" {
                studentDetail = filltered[indexPath.row]
            }else {
                studentDetail = students[indexPath.row]
                
            }
            studentDetailViewController.student = studentDetail
        default:
            print("")
        }
    }
    
    @IBAction func unwindFromVCToStudentTableVC(for unwindSegue: UIStoryboardSegue) {
        if let sourceViewController = unwindSegue.source as? ViewController, let student = sourceViewController.student {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                students[selectedIndexPath.row] = student
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            } else {
                let newIndexPath = IndexPath(row: students.count, section: 0)
                students.append(student)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
            saveStudents()
        }
    }
    
    private func loadSampleStudents() {
        let photo1 = UIImage(named: "std1")
        let photo2 = UIImage(named: "std2")
        let photo3 = UIImage(named: "std3")
        
        guard let student1 = Student(name: "Hoang Anh", year: 1994, address: "Hanoi", photo: photo1!) else {
            return
        }
        guard let student2 = Student(name: "Thai XZ",year: 1998, address: "HaDong", photo: photo2!) else {
            return
        }
        guard let student3 = Student(name: "Cuong Ngo",year: 1994, address: "HaNoi", photo: photo3!) else {
            return
        }
        
        
        students += [student1, student2, student3]
        
    }
    
    private func saveStudents() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(students, toFile: Student.ArchiveURL.path)
        if isSuccessfulSave {
            os_log("Students successfully save", log: OSLog.default, type: .debug)
        } else {
            os_log("Failed to save students", log: OSLog.default, type: .error)
        }
    }
    
    private func loadStudent() -> [Student]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Student.ArchiveURL.path) as? [Student]
    }
    
}

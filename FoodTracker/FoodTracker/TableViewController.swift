//
//  TableViewController.swift
//  FoodTracker
//
//  Created by KuAnh on 05/05/2018.
//  Copyright © 2018 KuAnh. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var student = [Student]()

    override func viewDidLoad() {
        super.viewDidLoad()
        reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if student.count == 0 {
            let alert = Helper()
            alert.showAlert(title: "Thong Bao", message: "Khong Co Du Lieu", fromController: self, preferredStyle: .alert)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if student.count == 0 {
            let alert = Helper()
            alert.showAlert(title: "Thong Bao", message: "Khong Co Du Lieu", fromController: self, preferredStyle: .alert)
        }
        return student.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell

        cell.idStd.text = student[indexPath.row].idStd
        cell.name.text = student[indexPath.row].name
        cell.imageStd.image = student[indexPath.row].imageStd

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
            student.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showInfo" {
            if let studentViewController = segue.destination as? ViewController {
                let indexPath = tableView.indexPathForSelectedRow!
                studentViewController.student = student[indexPath.row]
            }
        }
    }
    
    func reloadData() {
        let student1 = Student(id: "Gc00705", name: "Anh", image: UIImage(named: "Image.jpg")!)
        
        student += [student1]
    }
    

}

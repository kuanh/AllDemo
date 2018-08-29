//
//  StudentsTableViewController.swift
//  DemoSaveAndGetImageToCoreData
//
//  Created by KuAnh on 11/12/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit
import CoreData
import os.log

class StudentsTableViewController: UITableViewController, NSFetchedResultsControllerDelegate {
    
    var viewController: ViewController? = nil
    
    var managedObjectContext: NSManagedObjectContext = AppDelegate.shared.persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return fetchResultsController.sections?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let sectionInfo = fetchResultsController.sections![section]
        print(sectionInfo.numberOfObjects)
        return sectionInfo.numberOfObjects
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? StudentsTableViewCell else {
            fatalError("k thay cell")
        }

        let student = fetchResultsController.object(at: indexPath)
        configure(cell, withStudent: student)

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
            let context = fetchResultsController.managedObjectContext
            context.delete(fetchResultsController.object(at: indexPath))
            do {
                try context.save()
            } catch let error as NSError {
                fatalError("\(error), \(error.userInfo)")
            }
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
 
    
    func configure(_ cell: StudentsTableViewCell, withStudent student: Student) {
        cell.idStudent.text = student.idStd?.description
        cell.nameStudent.text = student.nameStd?.description
        cell.ageStudent.text = "\(student.age)"
        
        guard let image = student.imgStd else { return }
        cell.imageStudent.image = UIImage(data: image)
    }
    
    
    var fetchResultsController: NSFetchedResultsController<Student>{
        
        if _fetchResultsController != nil {
            return _fetchResultsController!
        }
        
        let fetchRequest: NSFetchRequest<Student> = Student.fetchRequest()
        fetchRequest.fetchBatchSize = 20
        
        let idStdSort = NSSortDescriptor(key: "idStd", ascending: false)
        let nameStdSort = NSSortDescriptor(key: "nameStd", ascending: false)
        let age = NSSortDescriptor(key: "age", ascending: false)
        let image = NSSortDescriptor(key: "imgStd", ascending: false)
        fetchRequest.sortDescriptors = [idStdSort,nameStdSort,age,image]
        
        let afetchResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: managedObjectContext, sectionNameKeyPath: nil, cacheName: "Big0")
        afetchResultsController.delegate = self
        _fetchResultsController = afetchResultsController
        
        do {
            try _fetchResultsController?.performFetch()
        } catch let error as NSError {
            print("\(error), \(error.userInfo)")
        }
        
        return _fetchResultsController!
    }
    
    var _fetchResultsController: NSFetchedResultsController<Student>? = nil

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch(segue.identifier ?? "") {
        case "addNewStudent":
            os_log("Add new Student", log: OSLog.default, type: .debug)
        case "showInfoStudent":
            if let indexPath = tableView.indexPathForSelectedRow {
                let object = fetchResultsController.object(at: indexPath)
                let controller = segue.destination as! ViewController
                controller.listStudent = object
            }
        default:
            fatalError("error")
        
        }
    }
    
    @IBAction func unwindFromVCToStdTableVC(for unwindSegue: UIStoryboardSegue) {
        if let vc = unwindSegue.source as? ViewController {
            
            if let indexPath = tableView.indexPathForSelectedRow, let listStd = vc.listStudent {
                var object = fetchResultsController.object(at: indexPath)
                object = listStd
                tableView.reloadRows(at: [indexPath], with: .none)
            } else {
                
                let newObject = Student(context: AppDelegate.shared.persistentContainer.viewContext)
                newObject.idStd = vc.txtId.text
                newObject.nameStd = vc.txtName.text
                guard let age = Int32(vc.txtAge.text!) else { fatalError("k lay duoc tuoi") }
                newObject.age = age
                guard let image = UIImageJPEGRepresentation(vc.photoStd.image!, 1) else { fatalError("k lay dk anh") }
                newObject.imgStd = image
            }
            
           AppDelegate.shared.saveContext()
        }
    }
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {
        switch type {
        case .insert:
            tableView.insertSections(IndexSet(integer: sectionIndex), with: .fade)
        case .delete:
            tableView.deleteSections(IndexSet(integer: sectionIndex), with: .fade)
        default:
            return
        }
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
            
        case .insert:
            tableView.insertRows(at: [newIndexPath!], with: .fade)
        case .delete:
            tableView.deleteRows(at: [indexPath!], with: .fade)
        case .move:
            configure(tableView.cellForRow(at: indexPath!) as! StudentsTableViewCell, withStudent: anObject as! Student)
        case .update:
            configure(tableView.cellForRow(at: indexPath!) as! StudentsTableViewCell, withStudent: anObject as! Student)
            tableView.moveRow(at: indexPath!, to: newIndexPath!)
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }

}

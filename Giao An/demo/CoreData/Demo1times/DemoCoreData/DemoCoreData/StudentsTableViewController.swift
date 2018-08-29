//
//  StudentsTableViewController.swift
//  DemoCoreData
//
//  Created by KuAnh on 30/11/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit
import CoreData
import os.log

class StudentsTableViewController: UITableViewController, NSFetchedResultsControllerDelegate {
    
    var viewController: ViewController? = nil
    
    var managedObjectContext: NSManagedObjectContext? = AppDelegate.shared.persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        return sectionInfo.numberOfObjects
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

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
            // Delete the row from the data source
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
    
    
    func configure(_ cell: UITableViewCell, withStudent student: Students) {
        cell.textLabel?.text = student.name?.description
        cell.detailTextLabel?.text = student.idStd?.description
    }
    
    var fetchResultsController: NSFetchedResultsController<Students> {
        
        if _fetchResultsController != nil {
            return _fetchResultsController!
        }
        
        let fetchRequest: NSFetchRequest<Students> = Students.fetchRequest()
        fetchRequest.fetchBatchSize = 20
        
        let idStdSort = NSSortDescriptor(key: "idStd", ascending: false)
        let nameStdSort = NSSortDescriptor(key: "name", ascending: false)
        fetchRequest.sortDescriptors = [idStdSort, nameStdSort]
        
        let aFetchResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.managedObjectContext!, sectionNameKeyPath: nil, cacheName: "Master")
        aFetchResultsController.delegate = self
        _fetchResultsController = aFetchResultsController
        do {
            try _fetchResultsController?.performFetch()
        } catch let error as NSError {
            print("\(error), \(error.userInfo)")
        }
        return _fetchResultsController!
    }
    
    var _fetchResultsController: NSFetchedResultsController<Students>? = nil

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch (segue.identifier ?? "") {
        case "addNewStudent":
            os_log("Adding new Student", log: OSLog.default, type: .debug)
        case "showStudents":
            if let indexPath = tableView.indexPathForSelectedRow {
                let object = fetchResultsController.object(at: indexPath)
                let controller = segue.destination as! ViewController
                controller.listStudents = object
            }
        default:
            fatalError("error")
        }
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        if let vc = unwindSegue.source as? ViewController { 
            if let indexPath = tableView.indexPathForSelectedRow, let listStd = vc.listStudents {
                var _object = fetchResultsController.object(at: indexPath)
                _object = listStd
                tableView.reloadRows(at: [indexPath], with: .none)
            }
        }
        tableView.reloadData()
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
            configure(tableView.cellForRow(at: indexPath!)!, withStudent: anObject as! Students)
        case .update:
            configure(tableView.cellForRow(at: indexPath!)!, withStudent: anObject as! Students)
            tableView.moveRow(at: indexPath!, to: newIndexPath!)
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }

}

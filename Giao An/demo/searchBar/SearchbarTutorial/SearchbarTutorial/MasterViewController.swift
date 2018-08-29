//
//  MasterViewController.swift
//  SearchbarTutorial
//
//  Created by Marco Aurelio Viana Almeida on 12/16/15.
//  Copyright © 2015 appscg.com. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    @IBOutlet weak var searchController: UISearchBar!
    
    var detailViewController: DetailViewController? = nil
    var carsArray = [Car]()
    var filteredCar = [Car]()
    
    func filterContentForSearchText(searchText: String, scope: String = "All") {
        filteredCar = carsArray.filter { car in
            return car.model.lowercased().contains(searchText.lowercased())
        }
        tableView.reloadData()
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
        
        //Load Cars from plist into Array
        let path = Bundle.main.path(forResource: "Cars", ofType: "plist")
        let dictArray = NSArray(contentsOfFile: path!)
        
        for carItem in dictArray! {
            let newCar : Car = Car(type:((carItem as AnyObject).object(forKey: "type")) as! String, maker: ((carItem as AnyObject).object(forKey: "maker")) as! String, model: ((carItem as AnyObject).object(forKey: "model")) as! String, image: ((carItem as AnyObject).object(forKey: "image")) as! String)
            carsArray.append(newCar)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (searchController != nil) && searchController.searchBar.text {
            
        }
        return carsArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let car = carsArray[indexPath.row]
        cell.textLabel!.text = car.model
        cell.detailTextLabel?.text = car.maker
        return cell
    }
    
    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let carDetail : Car = carsArray[indexPath.row]
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.carDetail = carDetail
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }
}

extension MasterViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchText: searchController.searchBar.text!)
    }
}


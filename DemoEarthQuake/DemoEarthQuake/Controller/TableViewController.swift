//
//  TableViewController.swift
//  DemoEarthQuake
//
//  Created by KuAnh on 04/06/2018.
//  Copyright © 2018 KuAnh. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBarEarthQuake: UISearchBar!
    
    
    var earthQuake : [EarthQuake] = []
    var rangeEarthQuake: String = ""
    
    var fillterEarthQuake : [EarthQuake] = []
    var searchActive: Bool = false
    
    private var pendingRequestWorkItem: DispatchWorkItem?

    override func viewDidLoad() {
        super.viewDidLoad()

            DataService.share.loadEarthQuake { [unowned self] (earthQuake) in
                self.earthQuake = earthQuake
                self.tableView.reloadData()
                
            }
        searchBarEarthQuake.delegate = self
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        self.fillterEarthQuake = self.earthQuake.filter({ (earthQuake) -> Bool in
            if earthQuake.place.convertString().location.lowercased().contains(searchBar.text!.lowercased()) ||  earthQuake.place.convertString().location.uppercased().contains(searchBar.text!.uppercased()) {
                return true
            } else {
                return false
            }
        })
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        if searchBarEarthQuake.text != "" {
            return fillterEarthQuake.count
        }else {
            
            return earthQuake.count
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        var earthQuakeAfterSearch: [EarthQuake] = []
        
        if searchBarEarthQuake.text != "" {
            earthQuakeAfterSearch = fillterEarthQuake
        }else {
            earthQuakeAfterSearch = earthQuake
        }
        

        cell.lbMag.text = String(earthQuakeAfterSearch[indexPath.row].mag)
        cell.lbRange.text = earthQuakeAfterSearch[indexPath.row].place.convertString().range
        cell.lbLocation.text = earthQuakeAfterSearch[indexPath.row].place.convertString().location
        cell.lbDay.text = earthQuakeAfterSearch[indexPath.row].timeInterval.convertDateTime().dateString
        cell.lbtime.text = earthQuakeAfterSearch[indexPath.row].timeInterval.convertDateTime().timeString

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

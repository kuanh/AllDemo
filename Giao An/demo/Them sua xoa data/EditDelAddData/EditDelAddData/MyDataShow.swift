//
//  MyDataShow.swift
//  EditDelAddData
//
//  Created by KuAnh on 18/10/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class MyDataShow: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    var arrayNumber = [0]
    var arrayTextString = ["1"]
    var vc: ShowDataTableViewController?
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if arrayNumber.count == 0 {
            tableView.separatorStyle = .none
            tableView.backgroundView?.isHidden = false
            let alert = Helper()
            alert.showAlertVC(title: "thong bao", message: "no data", fromController: vc!, preferredStyle: .alert)
        } else {
            tableView.separatorStyle = .singleLine
            tableView.backgroundView?.isHidden = true
        }
        return arrayNumber.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "123", for: indexPath)
        cell.textLabel?.text = "\(arrayNumber[indexPath.row])"
        cell.detailTextLabel?.text = arrayTextString[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        return true
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            tableView.beginUpdates()
            
            arrayNumber.remove(at: indexPath.row)
            arrayTextString.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
            tableView.endUpdates()
        }
        
    }
}

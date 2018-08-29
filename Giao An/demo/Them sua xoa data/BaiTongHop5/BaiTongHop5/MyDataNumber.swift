//
//  MyDataNumber.swift
//  BaiTongHop5
//
//  Created by KuAnh on 27/10/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class MyDataNumber: NSObject, UITableViewDelegate, UITableViewDataSource {
    var number = [Int](0...5)
    var vc: DemoTableViewController?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if number.count == 0 {
            let alert = Helper()
            alert.showAlert(title: "Thong Bao", message: "Khong Co Du Lieu", fromController: vc!, preferredStyle: .alert)
        }
        return number.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "num", for: indexPath)
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "string", for: indexPath)
        if number.count == indexPath.row {
            cell1.textLabel?.text = "aaaa"
            return cell1
        }else{
            cell.textLabel?.text = "\(number[indexPath.row])"
        }
        
        return cell
    }
    
     func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
         // Return false if you do not want the specified item to be editable.
        return true
     }
    
         // Override to support editing the table view.
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
         if editingStyle == .delete {
            tableView.beginUpdates()
            number.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
         }
     }
    
}

class MyDataTextString: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    var nameArray = ["Anh", "Lam"]
    var vc: DemoTableViewController?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if nameArray.count == 0 {
            let alert = Helper()
            alert.showAlert(title: "Thong Bao", message: "Khong Co Du Lieu", fromController: vc!, preferredStyle: .alert)
        }
        return nameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "string", for: indexPath)
        cell.textLabel?.text = nameArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    // Override to support editing the table view.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            nameArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
    }
}

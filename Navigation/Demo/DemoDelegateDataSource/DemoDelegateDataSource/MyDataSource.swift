//
//  MyDataSource.swift
//  DemoDelegateDataSource
//
//  Created by KuAnh on 14/10/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class MyDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    var array = [Int] (0...10)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "123", for: indexPath)
        cell.textLabel?.text = "\(array[indexPath.row])"
        return cell
    }
}

class MyDataSource1: NSObject, UITableViewDataSource, UITableViewDelegate {
    var array = ["khong", "mot", "hai", "ba", "bon", "Nam", "Sau", "Bay", "tam", "chin", "muoi"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "123", for: indexPath)
        cell.textLabel?.text = "\(array[indexPath.row])"
        return cell
    }
    
    
}


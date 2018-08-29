//
//  MyData.swift
//  DemoDataSourceDelegateViewController
//
//  Created by KuAnh on 14/10/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class MyData: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var  arr  = [Int](0...10)
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "123", for: indexPath)
        cell.textLabel?.text = "\(arr[indexPath.row])"
        return cell
    }

}

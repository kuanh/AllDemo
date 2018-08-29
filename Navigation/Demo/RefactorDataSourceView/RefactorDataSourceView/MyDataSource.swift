//
//  MyDataSource.swift
//  RefactorDataSourceView
//
//  Created by KuAnh on 12/10/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class MyDataSource: NSObject, UITableViewDataSource {
    
    private var tableView: UITableView
    private (set) internal var items: [String]
    
    init(tableView: UITableView) {
        
        self.items = ["Mot", "Hai", "Ba"]
        self.tableView = tableView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let array = self.items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "123", for: indexPath)
        cell.textLabel?.text = array
        return cell
    }
}

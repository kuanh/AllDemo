//
//  ViewController.swift
//  PullToRefresh
//
//  Created by Nguyen Quoc Tinh on 8/25/17.
//  Copyright © 2017 Tinh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    private let refreshControl = UIRefreshControl()
    private var number: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self

        // Setup Refresh Control
        self.refreshControl.addTarget(self, action: #selector(updateData), for: .valueChanged)
        
        // Customizing Refresh Control
        self.refreshControl.tintColor = UIColor.lightGray
        let attributes = [NSForegroundColorAttributeName: UIColor.lightGray]
        self.refreshControl.attributedTitle = NSAttributedString(string: "Refreshing Data...", attributes: attributes)

        // Add Refresh Control to Table View
        if #available(iOS 10.0, *) {
            self.tableView.refreshControl = refreshControl
        } else {
            self.tableView.addSubview(refreshControl)
        }
    }
    
    @objc private func updateData() {
        self.number += 1
        self.tableView.reloadData()
        self.refreshControl.endRefreshing()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
        cell.textLabel?.text = String(number)
        return cell
    }

}

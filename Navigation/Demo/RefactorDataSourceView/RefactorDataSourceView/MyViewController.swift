//
//  MyViewController.swift
//  RefactorDataSourceView
//
//  Created by KuAnh on 12/10/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {
    
//    @IBOutlet weak var switchBT: UISwitch!
    @IBOutlet weak var tableView: UITableView!
    private lazy var dataSource: MyDataSource! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = MyDataSource(tableView: self.tableView)
        self.tableView.dataSource = self.dataSource
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

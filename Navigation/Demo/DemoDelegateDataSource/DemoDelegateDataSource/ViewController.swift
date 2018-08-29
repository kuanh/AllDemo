//
//  ViewController.swift
//  DemoDelegateDataSource
//
//  Created by KuAnh on 14/10/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    
    @IBOutlet weak var switchBT: UISwitch!
    
    @IBOutlet weak var myTableView: UITableView!
    
    var myData = MyDataSource()
    var data2 = MyDataSource1()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myTableView.dataSource = myData
    }
    
    @IBAction func clickShow(_ sender: UISwitch) {
        if sender.isOn {
            myTableView.dataSource = myData
        } else {
            myTableView.dataSource = data2
        }
        myTableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


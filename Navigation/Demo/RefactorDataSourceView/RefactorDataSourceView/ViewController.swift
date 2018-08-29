//
//  ViewController.swift
//  RefactorDataSourceView
//
//  Created by KuAnh on 12/10/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var switchBt: UISwitch!
    var number = [Int](0...2)
    var numberString = ["Khong", "Mot", "Hai"]
    var arrayNumber: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        ClickShowNumber(switchBt)
    }

    @IBAction func ClickShowNumber(_ sender: UISwitch) {
        if sender.isOn {
            var num = [String]()
            for i in number {
                num.append("\(i)")
            }
            arrayNumber = num
        } else {
            arrayNumber = numberString
        }
        print(arrayNumber)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayNumber.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "123", for: indexPath)
        cell.textLabel?.text = arrayNumber[indexPath.row]
        return cell
    }
}


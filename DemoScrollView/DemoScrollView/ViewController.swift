//
//  ViewController.swift
//  DemoScrollView
//
//  Created by KuAnh on 21/05/2018.
//  Copyright © 2018 KuAnh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollViewChange: UIScrollView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var stackViewHeight: NSLayoutConstraint!
    @IBOutlet weak var tableHeight: NSLayoutConstraint!
    var arr = Array(0...10)
    
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbage: UILabel!
    @IBOutlet weak var lbadrress: UILabel!
    @IBOutlet weak var lbDes: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableHeight.constant = self.view.frame.height - 208
        self.tableView.isScrollEnabled = true
        self.scrollViewChange.bounces = false
        self.tableView.bounces = true
        loadData()
    }
    
    func loadData() {
        lbName.text = "A"
        lbage.text = "\(23)"
        lbadrress.text = "Ha noi"
        lbDes.text = "No"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        if scrollView == self.scrollViewChange {
            tableView.isScrollEnabled = (self.scrollViewChange.contentOffset.y >= 44)
        }
        if scrollView == self.tableView {
            self.tableView.isScrollEnabled = (self.scrollViewChange.contentOffset.y > 0)
        }
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = "\(arr[indexPath.row])"
        return cell
    }
    
    
}

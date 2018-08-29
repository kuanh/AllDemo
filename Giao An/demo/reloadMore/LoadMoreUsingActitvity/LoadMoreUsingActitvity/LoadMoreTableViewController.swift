//
//  LoadMoreTableViewController.swift
//  LoadMoreUsingActitvity
//
//  Created by KuAnh on 27/10/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class LoadMoreTableViewController: UITableViewController {
    var number = [Int](0...15)
    var num = 15
    
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        myActivityIndicator.isHidden = false
        myActivityIndicator.activityIndicatorViewStyle = .gray
//        self.view.addSubview(myActivityIndicator)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if number.count >= 26 {
            myActivityIndicator.stopAnimating()
            myActivityIndicator.isHidden = true
        } else {
            myActivityIndicator.startAnimating()
            myActivityIndicator.isHidden = false
        }
        return number.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(number[indexPath.row])"

        return cell
    }
    
    var time = Timer()
    
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastItem = number.count - 1
        if indexPath.row == lastItem {
            time.invalidate()
            time = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(loadData), userInfo: nil, repeats: true)
        }
    }
    
    @objc func loadData() {
        if number.count <= 25 {
//            num += 1
            number.append(number.count)
            tableView.reloadData()
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  ViewController1.swift
//  TarBarController
//
//  Created by KuAnh on 23/05/2018.
//  Copyright © 2018 KuAnh. All rights reserved.
//

import UIKit

class ViewController1: UIViewController {

    @IBOutlet weak var lbView: UILabel!
    var myOrder = OrderModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        let tbc = self.tabBarController  as! TabViewController
        myOrder = tbc.myOrder
        // Do any additional setup after loading the view.
    }
    @IBAction func saveView(_ sender: UIButton) {
        myOrder.pizza = (sender.titleLabel?.text)!
        lbView.text = myOrder.currentOrder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        lbView.text = myOrder.currentOrder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

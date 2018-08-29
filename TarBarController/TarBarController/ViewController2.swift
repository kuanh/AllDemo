//
//  ViewController2.swift
//  TarBarController
//
//  Created by KuAnh on 23/05/2018.
//  Copyright © 2018 KuAnh. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
    var myOrder = OrderModel()
    
    @IBOutlet weak var lbPie: UILabel!
    @IBOutlet weak var lbPizza: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        myOrder = (tabBarController as! TabViewController).myOrder
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        lbPie.text = myOrder.pie
        lbPizza.text = myOrder.pizza
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

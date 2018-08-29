//
//  ViewController.swift
//  UnwindSegue
//
//  Created by Ashish on 4/28/15.
//  Copyright (c) 2015 Ashish. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func unwindToVC(segue:UIStoryboardSegue) {
        if(segue.sourceViewController .isKindOfClass(ViewController2))
        {
            var view2:ViewController2 = segue.sourceViewController as ViewController2
            let alert = UIAlertView()
            alert.title = "UnwindSegue Data"
            alert.message = view2.data
            alert.addButtonWithTitle("Ok")
            alert.show()
        }
        if(segue.sourceViewController .isKindOfClass(ViewController3))
        {
            var view3:ViewController3 = segue.sourceViewController as ViewController3
            let alert = UIAlertView()
            alert.title = "UnwindSegue Data"
            alert.message = view3.data
            alert.addButtonWithTitle("Ok")
            alert.show()
        }
    }
}


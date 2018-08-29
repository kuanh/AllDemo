//
//  ViewController.swift
//  DemoCoreDataStudent
//
//  Created by KuAnh on 28/11/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtID: UITextField!
    @IBOutlet weak var txtName: UITextField!
    
    func configureView() {
        if let list = listStudents {
            if let id = txtID, let name = txtName {
                id.text = list.idStd?.description
                name.text = list.nameStd?.description
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
var listStudents: Students? {
        didSet{
            configureView()
        }
    }

}


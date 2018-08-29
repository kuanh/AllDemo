//
//  ViewController.swift
//  FoodTracker
//
//  Created by KuAnh on 05/05/2018.
//  Copyright © 2018 KuAnh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtId: UITextField!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var viewPhoto: UIImageView!
    
    var student: Student?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func selectedImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
    }
    
}


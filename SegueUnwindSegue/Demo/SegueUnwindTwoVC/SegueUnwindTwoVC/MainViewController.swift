//
//  ViewController.swift
//  SegueUnwindTwoVC
//
//  Created by KuAnh on 05/10/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var showImage: UIImageView!
    @IBOutlet weak var lblData: UILabel?
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        lblData?.text = DataPassing.shared.textToPassing
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToSubViewController(unwindSegue: UIStoryboardSegue) {
//        if unwindSegue.identifier == "ShowName" {
//            let subVC = unwindSegue.source as! SubViewController
//            lblData?.text = subVC.txtData?.text ?? ""
//        }
        switch (unwindSegue.identifier ?? "") {
        case "ShowName":
            let subVC = unwindSegue.source as! SubViewController
            lblData?.text = DataPassing.shared.textToPassing
            
        case "ShowImage" :
            let addImageVC = unwindSegue.source as! AddImageViewController
            showImage.image = addImageVC.photoImageView.image
        default:
            fatalError("\(unwindSegue.identifier)")
        }
    }


}


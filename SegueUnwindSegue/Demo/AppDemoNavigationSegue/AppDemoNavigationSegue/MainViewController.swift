//
//  ViewController.swift
//  AppDemoNavigationSegue
//
//  Created by KuAnh on 07/10/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var photoImageViewInfo: UIImageView!
    @IBOutlet weak var lblHeight: UILabel?
    @IBOutlet weak var lblAddress: UILabel?
    @IBOutlet weak var lblJob: UILabel?
    @IBOutlet weak var lblJobPosition: UILabel!
    @IBOutlet weak var lblUniversity: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToEditVCFromMainVC(unwindSegue: UIStoryboardSegue) {
//        if unwindSegue.identifier == "ShowInfo" {
//            let editVC = unwindSegue.source as! EditViewController
//            lblHeight?.text = "\(editVC.txtHeight!)"
//            photoImageViewInfo.image = editVC.photoImageView.image
//            lblJobPosition?.text = editVC.txtJobPosition.text ?? ""
//            lblAddress?.text = "\(editVC.txtAddress!)"
//            lblJob?.text = "\(editVC.txtJob!)"
//            lblUniversity.text = "\(editVC.txtUnversity!)"
//
//        }
        
        if unwindSegue.identifier == "ShowInfo" {
            let editPickerVC = unwindSegue.source as! EditPickerViewController
            photoImageViewInfo.image = editPickerVC.photoImageView.image
            lblHeight?.text = editPickerVC.txtHeight.text
            lblAddress?.text = editPickerVC.txtAddress.text
            lblJobPosition?.text = editPickerVC.txtJobPosition.text ?? ""
            lblJob?.text = editPickerVC.txtJob.text
            lblUniversity.text = editPickerVC.txtUniversity.text
            
        }
    }


}


//
//  DetailViewController.swift
//  DemoImageSplitVC
//
//  Created by KuAnh on 05/11/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var imageStudent: UIImageView!
    
    var student: Student?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let std = student {
            self.detailDescriptionLabel.text = std.name
            self.imageStudent.image = std.weaponImage()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


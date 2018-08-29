//
//  UnknownWifiTableViewCell.swift
//  DemoAppWifi
//
//  Created by KuAnh on 03/10/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class UnknownWifiTableViewCell: UITableViewCell {

    
    @IBOutlet weak var strangeButton: UIButton!
    @IBOutlet weak var unImage: UIImageView!
    @IBOutlet weak var unLabel: UILabel!
    @IBOutlet weak var ipLabel: UILabel!
//    @IBAction func tapStart(_ sender: AnyObject?) {
//        self.strangeButton.isHidden = false
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

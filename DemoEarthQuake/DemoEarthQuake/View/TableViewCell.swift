//
//  TableViewCell.swift
//  DemoEarthQuake
//
//  Created by KuAnh on 04/06/2018.
//  Copyright © 2018 KuAnh. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var lbMag: UILabel!
    @IBOutlet weak var lbRange: UILabel!
    @IBOutlet weak var lbLocation: UILabel!
    @IBOutlet weak var lbDay: UILabel!
    @IBOutlet weak var lbtime: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

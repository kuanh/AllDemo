//
//  DemoStudentTableViewCell.swift
//  BaiTongKet5
//
//  Created by KuAnh on 03/11/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class DemoStudentTableViewCell: UITableViewCell {

    @IBOutlet weak var showImageSelected: UIImageView!
    @IBOutlet weak var showName: UILabel!
    @IBOutlet weak var showYear: UILabel!
    @IBOutlet weak var showAddress: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

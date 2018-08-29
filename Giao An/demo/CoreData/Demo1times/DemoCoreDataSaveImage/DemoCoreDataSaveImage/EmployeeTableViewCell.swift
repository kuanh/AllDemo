//
//  EmployeeTableViewCell.swift
//  DemoCoreDataSaveImage
//
//  Created by KuAnh on 09/12/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {

    @IBOutlet weak var imageEmp: UIImageView!
    @IBOutlet weak var lbIdEmp: UILabel!
    @IBOutlet weak var lbNameEmp: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  EmployeeTableViewCell.swift
//  DemoCoreDataEmployee
//
//  Created by KuAnh on 09/12/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {

    @IBOutlet weak var photoEmp: UIImageView!
    @IBOutlet weak var idEmp: UILabel!
    @IBOutlet weak var nameEmp: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

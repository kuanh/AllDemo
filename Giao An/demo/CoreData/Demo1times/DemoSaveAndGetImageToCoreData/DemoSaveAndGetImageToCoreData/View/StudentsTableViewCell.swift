//
//  StudentsTableViewCell.swift
//  DemoSaveAndGetImageToCoreData
//
//  Created by KuAnh on 11/12/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class StudentsTableViewCell: UITableViewCell {

    @IBOutlet weak var idStudent: UILabel!
    @IBOutlet weak var nameStudent: UILabel!
    @IBOutlet weak var ageStudent: UILabel!
    @IBOutlet weak var imageStudent: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

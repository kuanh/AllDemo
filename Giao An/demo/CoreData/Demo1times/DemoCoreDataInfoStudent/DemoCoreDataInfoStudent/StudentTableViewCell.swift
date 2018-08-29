//
//  StudentTableViewCell.swift
//  DemoCoreDataInfoStudent
//
//  Created by KuAnh on 03/05/2018.
//  Copyright © 2018 KuAnh. All rights reserved.
//

import UIKit

class StudentTableViewCell: UITableViewCell {

    @IBOutlet weak var nameStudent: UILabel!
    @IBOutlet weak var ageStudent: UILabel!
    @IBOutlet weak var addressStudent: UILabel!
    @IBOutlet weak var photoStudent: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

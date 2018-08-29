//
//  TableViewCell.swift
//  FoodTracker
//
//  Created by KuAnh on 05/05/2018.
//  Copyright © 2018 KuAnh. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var idStd: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var imageStd: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

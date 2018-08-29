//
//  MealTableViewCell.swift
//  FoodTrackerHaveSearchBar
//
//  Created by KuAnh on 31/10/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {
    
    @IBOutlet weak var photoImageShow: UIImageView!
    @IBOutlet weak var nameLabelShow: UILabel!
    @IBOutlet weak var ratingShow: RatingControl!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

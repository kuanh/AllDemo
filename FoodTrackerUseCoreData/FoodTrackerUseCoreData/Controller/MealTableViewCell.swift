//
//  MealTableViewCell.swift
//  FoodTrackerCoreData
//
//  Created by KuAnh on 21/05/2018.
//  Copyright © 2018 KuAnh. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbAddress: UILabel!
    @IBOutlet weak var showImage: UIImageView!
    @IBOutlet weak var rating: RatingControl!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

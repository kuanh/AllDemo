//
//  DetailViewController.swift
//  DemoSpilitViewController
//
//  Created by KuAnh on 05/11/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

extension DetailViewController: MonsterSelectionDelegate {
    func monterSelected(newMonster: Monster) {
        monster = newMonster
    }
}

class DetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var weaponImage: UIImageView!
    
    var monster: Monster! {
        didSet (newMonster) {
            self.refreshUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func refreshUI() {
        nameLabel.text = monster.name
        descriptionLabel.text = monster.description1
        iconImage.image = UIImage(named: monster.iconName)
        weaponImage.image = monster.weaponImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

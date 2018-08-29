//
//  ViewController.swift
//  DemoURLSessionApi
//
//  Created by KuAnh on 15/05/2018.
//  Copyright © 2018 KuAnh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let urlPath = "http://infomationchampion.pe.hu/showInfo.php?index=1&number=20"

    var champs: [InfomationChampion] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DataService.shared.loadChampsInfo { (champs) in
            self.champs = champs
        }
//        DataService.shared.loadChampsInfo {[unowned self] (champs) in
//            self.champs = champs
//            /// tableView.reloadData()
//            champs.forEach { print($0.nameVN_Champ) }
//        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//
//  ViewController.swift
//  ExtensionsViewController
//
//  Created by KuAnh on 07/11/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet fileprivate weak var titleLbl: UILabel!
    @IBOutlet fileprivate weak var actionBtn: UIButton!
    @IBOutlet fileprivate weak var collectionView: UICollectionView!
    
    //MARK: Internal Properties
    var titleText: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}



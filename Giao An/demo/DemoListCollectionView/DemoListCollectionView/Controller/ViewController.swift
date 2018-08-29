//
//  ViewController.swift
//  DemoListCollectionView
//
//  Created by KuAnh on 03/03/2018.
//  Copyright © 2018 KuAnh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var displayImageView: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var tongSoNgay: [String] = ["2/3 AM","2/3 PM","2/3 PM","2/3 PM","2/3 PM","2/3 PM","2/3 PM","2/3 PM","2/3 PM"]
    var arrayDays: [String] {
        get {
            return tongSoNgay
        }
        set {
            self.tongSoNgay = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress = 0.2
        displayImageView.image = UIImage(named: "T1")

        let numberOfItem = CGFloat(6)
        let widthItem = (UIScreen.main.bounds.size.width - 2 * 10 ) / numberOfItem
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: widthItem, height: widthItem)
        layout.minimumLineSpacing = 4
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    // MARK: UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return arrayDays.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! DetailsCollectionViewCell
        
        cell.lbDays.text = arrayDays[indexPath.row]
        
        return cell
    }
    
}



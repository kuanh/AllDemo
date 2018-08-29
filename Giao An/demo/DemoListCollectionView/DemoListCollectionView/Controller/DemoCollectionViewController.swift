//
//  DemoCollectionViewController.swift
//  DemoListCollectionView
//
//  Created by KuAnh on 03/03/2018.
//  Copyright © 2018 KuAnh. All rights reserved.
//

import UIKit
import os.log

private let reuseIdentifier = "Cell"

class DemoCollectionViewController: UICollectionViewController {
    
    var data = [DataModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let numberOfSection: CGFloat = 2
        let widthItem = (UIScreen.main.bounds.size.width - 2 * 10 - (numberOfSection + 1) * 10) / numberOfSection
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: widthItem, height: widthItem + 20)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        collectionView?.collectionViewLayout = layout   
        
        reloadData()
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier ?? "" {
        case "setting":
            os_log("add new Item", log: OSLog.default, type: .debug)
        default:
            print("err")
        }
    }
 

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return data.count + 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        if indexPath.row > data.count - 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell2", for: indexPath)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! DemoCollectionViewCell
            
            cell.imgView.image = data[indexPath.row].imageView
            cell.lbName.text = data[indexPath.row].nameTree
            
            return cell
        }
    
    }
    
    func reloadData() {
        let data1 = DataModel(img: UIImage(named: "T1"), name: "Dau")
        let data2 = DataModel(img: UIImage(named: "T1"), name: "Nam")
        let data3 = DataModel(img: UIImage(named: "T1"), name: "Tao")
        
        data += [data1, data2, data3]
    }

}

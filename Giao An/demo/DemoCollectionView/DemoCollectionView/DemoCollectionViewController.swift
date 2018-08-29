//
//  DemoCollectionViewController.swift
//  DemoCollectionView
//
//  Created by KuAnh on 02/03/2018.
//  Copyright © 2018 KuAnh. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class DemoCollectionViewController: UICollectionViewController {
    
    var model = [Model]()

    override func viewDidLoad() {
        super.viewDidLoad()
        reloadData()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return model.count + 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row > model.count {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell2", for: indexPath)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! DemoCollectionViewCell
            cell.pgView.progress = model[indexPath.row].progressView
            cell.img.image = model[indexPath.row].imageTree
            cell.lbName.text = model[indexPath.row  ].name
            return cell
        }
        
    }
    
    
    private func reloadData(){
        guard let cay1 = Model(progressView: 20, imgTree: UIImage(named: "default"), name: "cay dau") else {
            fatalError("error1")
        }
        guard let cay2 = Model(progressView: 30, imgTree: UIImage(named: "default"), name: "cay dau") else {
            fatalError("error1")
        }
        guard let cay3 = Model(progressView: 10, imgTree: UIImage(named: "default"), name: "cay dau") else {
            fatalError("error1")
        }
        
        model += [cay1,cay2,cay3]
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}

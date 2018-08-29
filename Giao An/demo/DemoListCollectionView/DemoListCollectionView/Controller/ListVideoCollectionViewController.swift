//
//  ListVideoCollectionViewController.swift
//  DemoListCollectionView
//
//  Created by KuAnh on 12/03/2018.
//  Copyright © 2018 KuAnh. All rights reserved.
//

import UIKit
import AVKit

private let reuseIdentifier = "Cell"

class ListVideoCollectionViewController: UICollectionViewController {
    
    var selectedCheckMark = true
    var dataVideo = [DataVideo]()

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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

//    @IBAction func clickCheckMark(_ sender: UIButton) {
//        let indexPaths = collectionView?.indexPathsForVisibleItems
//        for indexPath in indexPaths!{
//            let cell = collectionView?.cellForItem(at: indexPath) as? ListVideoCollectionViewCell
//            if cell?.clickCheckMarkButton.isHighlighted == true {
//                cell?.clickCheckMarkButton.isSelected = true
//                sender.setTitleColor(UIColor.black, for: .selected)
//            } else {
//                cell?.clickCheckMarkButton.isHighlighted = true
//                sender.setTitleColor(UIColor.black, for: .highlighted)
//            }
//        }
//    }
    @IBAction func playVideo(_ sender: Any) {
        if let path = Bundle.main.path(forResource: "video1", ofType: "mp4") {
            let video = AVPlayer(url: URL(fileURLWithPath: path))
            let videoPlayer = AVPlayerViewController()
            videoPlayer.player = video
            
            present(videoPlayer, animated: true, completion: {
                video.play()
            })
        }
    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return dataVideo.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ListVideoCollectionViewCell
    
        cell.photoOfVideo.image = dataVideo[indexPath.row].imageView
        
    
        return cell
    }
    
    func reloadData() {
        let data1 = DataVideo(img: UIImage(named: "video1"))
        let data2 = DataVideo(img: UIImage(named: "T1"))
        let data3 = DataVideo(img: UIImage(named: "T1"))
        dataVideo += [data1, data2, data3]
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        if let cell = collectionView.cellForItem(at: indexPath) as? ListVideoCollectionViewCell {
            if cell.clickCheckMarkButton.isSelected == false {
                cell.clickCheckMarkButton.isSelected = true
                cell.clickCheckMarkButton.isHighlighted = false
            } else {
                cell.clickCheckMarkButton.isHighlighted = true
                cell.clickCheckMarkButton.isSelected = false
            }
        }
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

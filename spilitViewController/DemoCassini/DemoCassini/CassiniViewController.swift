//
//  CassiniViewController.swift
//  DemoCassini
//
//  Created by KuAnh on 08/11/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class CassiniViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private struct Storyboard {
        static let ShowImageSegue = "ShowImage"
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Storyboard.ShowImageSegue {
            if let imageVC = segue.destination as? ViewController {
                if let imageName = (sender as? UIButton)?.currentTitle {
                    imageVC.imageURL = DemoURl.LMHTImageNamed(imageName: imageName)
                }
            }
        }
    }
    
    
//    @IBAction func showImage(_ sender: UIButton) {
//        if let imageVC = splitViewController?.viewControllers.last as? ViewController {
//            if let imageName = sender.currentTitle {
//                imageVC.imageURL = DemoURl.LMHTImageNamed(imageName: imageName)
//                imageVC.title = imageName
//            }
//        }
//        else {
//            performSegue(withIdentifier: Storyboard.ShowImageSegue, sender: sender)
//        }
//    }
    

}


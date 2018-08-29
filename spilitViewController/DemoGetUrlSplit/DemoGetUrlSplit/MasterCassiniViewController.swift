//
//  MasterCassiniViewController.swift
//  DemoGetUrlSplit
//
//  Created by KuAnh on 08/11/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class MasterCassiniViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        splitViewController?.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private struct Storyboard {
        static let ShowImageSegue = "Show Image"
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Storyboard.ShowImageSegue {
            if let imageVC = segue.destination.contentViewController as? DetailViewController {
                if let imageName = (sender as? UIButton)?.currentTitle {
                    imageVC.imageURL = DemoURl.LMHTImageNamed(imageName: imageName)
                }
            }
        }
    }
    
    @IBAction func showImage(_ sender: UIButton) {
        if let imageVC = splitViewController?.viewControllers.last?.contentViewController as? DetailViewController {
            if let imageName = sender.currentTitle {
                imageVC.imageURL = DemoURl.LMHTImageNamed(imageName: imageName)
                imageVC.title = imageName
            }
        } else {
            performSegue(withIdentifier: Storyboard.ShowImageSegue, sender: sender)
        }
    }
    

}

extension UIViewController {
    var contentViewController: UIViewController {
        if let navContentVC = self as? UINavigationController {
            return navContentVC.visibleViewController!
        } else {
            return self
        }
    }
}

extension MasterCassiniViewController: UISplitViewControllerDelegate {
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        if primaryViewController.contentViewController == self {
            if let imageVC = secondaryViewController.contentViewController as? DetailViewController, imageVC.imageURL == nil {
                return true
            }
        }
        return false
    }
}

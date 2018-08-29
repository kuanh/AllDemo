//
//  CassiniViewController.swift
//  DemoSplitViewControllerCassini
//
//  Created by KuAnh on 10/11/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit



class CassiniViewController: UIViewController {
    
    
    

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
            if let imageVC = segue.destination.contentViewController as? ImageViewController { //Thêm navigationVC cho ImageViewController
                if let imageName = (sender as? UIButton)?.currentTitle{
                    imageVC.imageURL = DemoURL.HEROImageNamed(imageNamed: imageName)
                    
                }
            }
        }
    }
    
    //Tái sử dụng instance của class ImageViewController
    // - Do mỗi lần sử dụng perform segue, chương trình đều tạo ra 1 instance của details viewcontroller.
    //- Việc tạo ra các instance này là không cần thiết trong trường hợp cả master và details đều đang xuất hiện.
    //- Vì vậy chúng ta sẽ tìm cách tái sử dụng lại details View controller mà không cần phải khỏi tạo 1 instance mới trong trường hợp trên
    @IBAction func showImage(_ sender: UIButton) {
        if let imageVC = splitViewController?.viewControllers.last?.contentViewController as? ImageViewController {
            if let imageName = sender.currentTitle {
                imageVC.imageURL = DemoURL.HEROImageNamed(imageNamed: imageName)
                imageVC.title = imageName
            } else {
                performSegue(withIdentifier: Storyboard.ShowImageSegue, sender: sender)
            }
        }
    }
}

//tạo extension cho UIViewController nhằm truy cập vào ImageViewController nằm sau NavigationVC
extension UIViewController {
    var contentViewController: UIViewController {
        if let navContentVC = self as? UINavigationController {
            return navContentVC.visibleViewController!
        } else {
            return self
        }
    }
}
// ẩn imageVC trong trường hợp imageURL == nil
extension CassiniViewController: UISplitViewControllerDelegate {
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        if primaryViewController.contentViewController == self {
            if let imageVC = secondaryViewController.contentViewController as? ImageViewController, imageVC.imageURL == nil {
                return true
            }
        }
        return false
    }
}

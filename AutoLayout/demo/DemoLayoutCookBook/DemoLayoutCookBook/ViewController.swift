//
//  ViewController.swift
//  DemoLayoutCookBook
//
//  Created by KuAnh on 06/10/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let insets = UIEdgeInsetsMake(20.0, 0.0, 0.0, 0.0)
        scrollView.contentInset = insets
        scrollView.scrollIndicatorInsets = insets
    }
    
    //Mark: Action Methods
//    @IBAction func addEntry (sender: AnyObject){
//        let stack = stackView
//        let index = (stack?.arrangedSubviews.count)! - 1
//        let addView = stack?.arrangedSubviews[index]
//
//        let scroll = scrollView
//        let offset = CGPoint(x: (scroll?.contentOffset.x)!, y: (scroll?.contentOffset.y)! + (addView?.frame.size.height)!)
//
//        let newView = createEntry()
//        newView.isHidden = true
//        stack?.insertArrangedSubview(newView, at: index)
//
//        UIView.animate(withDuration: 0.25) { () -> Void in
//            newView.isHidden = false
//            scroll?.contentOffset = offset
//        }
//    }
    
    
    //Mark: - Private Methods
//    private func createEntry() -> UIView{
//
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


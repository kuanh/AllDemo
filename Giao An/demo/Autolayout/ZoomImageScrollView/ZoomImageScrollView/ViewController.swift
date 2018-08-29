//
//  ViewController.swift
//  ZoomImageScrollView
//
//  Created by KuAnh on 02/11/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var imageZoom: UIImageView!
    @IBOutlet weak var scrollImg: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollImg.minimumZoomScale = 1.0
        self.scrollImg.maximumZoomScale = 20.0
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageZoom
    }
}


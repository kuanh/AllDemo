//
//  ZoomingImageViewController.swift
//  SplitPhotoScrollView
//
//  Created by KuAnh on 07/11/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class ZoomingImageViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    var listImage: PhotoInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView.delegate = self
        imageView.image = listImage?.listPhoto()
        self.scrollView.minimumZoomScale = 1.0
        self.scrollView.maximumZoomScale = 20.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
}

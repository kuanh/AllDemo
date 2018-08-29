//
//  DetailViewController.swift
//  zoomingImageViewSplit
//
//  Created by KuAnh on 07/11/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIScrollViewDelegate {

    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    var listPhoto: ListPhoto?

    func configureView() {
        // Update the user interface for the detail item.
        if let list = listPhoto {
            imageView.image = listPhoto?.listPhoto()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        scrollView.delegate = self
        configureView()
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 20.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }


}


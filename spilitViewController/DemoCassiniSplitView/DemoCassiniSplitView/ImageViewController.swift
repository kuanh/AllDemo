//
//  ImageViewController.swift
//  DemoCassiniSplitView
//
//  Created by KuAnh on 10/11/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.delegate = self
            scrollView.contentSize = imageView.frame.size
        }
    }
    
    var imageURL: URL? {
        didSet {
            image = nil
            fetchImage()
        }
    }
    
    private func fetchImage() {
        guard let url = imageURL else {return}
        guard let data = try? Data(contentsOf: url) else {return}
        image = UIImage(data: data)
        
    }
    
    private var imageView = UIImageView()
    private var image: UIImage? {
        set {
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView.contentSize = imageView.frame.size
        }
        get {
            return imageView.image
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.addSubview(imageView)
        imageURL = URL(string: DemoURL.Standford)
        
        
    }

}

extension ImageViewController: UIScrollViewDelegate {
    
}

//
//  ViewController.swift
//  DemoSplitViewControllerCassini
//
//  Created by KuAnh on 10/11/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit


class ImageViewController: UIViewController {
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.delegate = self
            scrollView.contentSize = imageView.frame.size
            scrollView.minimumZoomScale = 0.03
            scrollView.maximumZoomScale = 1
        }
    }
    
    
    var imageURL: URL? {
        didSet {
            image = nil
            if view.window != nil {
                fetchImage()
            }
        }
    }
    
    private func fetchImage() {
        guard let url = imageURL else {return}
        if let imageCache = MyImageCache.sharedCache.object(forKey: url.absoluteString as NSString) { //kiem tra key trong cache da ton tai chua
            image = imageCache                                         // Neu da ton tai thi image bang image cua key do
            return
        }
        self.spinner.startAnimating()
        
        
        //chuyển tác vụ get dữ liệu ảnh sang một queue khác để tránh block main queue
        DispatchQueue.global(qos: .userInitiated).async {
            guard let data = try? Data(contentsOf: url) else {
                self.spinner.stopAnimating()
                return
            }
            DispatchQueue.main.async {
                if let imageFromCache = UIImage(data: data){
                    self.image = imageFromCache
                    MyImageCache.sharedCache.setObject(imageFromCache, forKey: url.absoluteString as NSString)
                    self.spinner.stopAnimating()
                }
            }
        }
        
        
    }
    
    private var imageView = UIImageView()
    private var image: UIImage? {
        set {
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView?.contentSize = imageView.frame.size
        }
        get {
            return imageView.image
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if image == nil {
            fetchImage()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        scrollView.addSubview(imageView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

extension ImageViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}

//extension ImageViewController: NSCacheDelegate {
//    
//}



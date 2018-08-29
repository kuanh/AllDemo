//
//  DetailViewController.swift
//  DemoCassiniSplit
//
//  Created by KuAnh on 08/11/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var scrollView: UIScrollView! {
        self.scrollView.delegate = self
        self.scrollView.contentSize = imageView.frame.size
        self.scrollView.minimumZoomScale = 1.0
        self.scrollView.maximumZoomScale = 0.03
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
        spinner.startAnimating()
        DispatchQueue.global(qos: .userInitiated).async {
            guard let data = try? Data(contentsOf: url) else {
                self.spinner.stopAnimating()
                return}
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
                self.spinner.stopAnimating()
            }
        }
        
    }
    
    var imageView = UIImageView()
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

extension DetailViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}


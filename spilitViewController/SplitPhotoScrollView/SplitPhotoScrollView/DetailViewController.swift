//
//  DetailViewController.swift
//  SplitPhotoScrollView
//
//  Created by KuAnh on 07/11/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var imagePhotoView: UIImageView!
    
    var listImage: PhotoInfo?

    func configureView() {
        // Update the user interface for the detail item.
        if let listImg = listImage {
            if let label = detailDescriptionLabel {
                label.text = listImg.name
            }
            self.imagePhotoView.image = listImg.listPhoto()
        }
    }
    @IBAction func openZoomingController(_ sender: AnyObject) {
        self.performSegue(withIdentifier: "zooming", sender: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override open func prepare(for segue: UIStoryboardSegue,
                               sender: Any?) {
        if let id = segue.identifier,
            let zoomedPhotoViewController = segue.destination as? ZoomingImageViewController,
            id == "zooming" {
            zoomedPhotoViewController.listImage = listImage
            
        }
    }

}


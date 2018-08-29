//
//  ViewController3.swift
//  DemoAnimationView
//
//  Created by KuAnh on 18/05/2018.
//  Copyright © 2018 KuAnh. All rights reserved.
//

import UIKit

class ViewController3: UIViewController {

    @IBOutlet weak var loadImg: UIImageView!
    
    var listImg: [UIImage] = []
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadData()
    }
    
    func loadData() {
        for i in 1...17 {
            guard let img = UIImage(named: "\(i)") else { return }
            listImg.append(img)
        }
        
        let animation = UIImage.animatedImage(with: listImg, duration: 100)
        loadImg.image = animation
        loadImg.startAnimating()
    }


}

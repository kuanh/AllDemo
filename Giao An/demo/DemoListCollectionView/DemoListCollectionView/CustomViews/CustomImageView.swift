//
//  CustomImageView.swift
//  DemoListCollectionView
//
//  Created by KuAnh on 03/03/2018.
//  Copyright © 2018 KuAnh. All rights reserved.
//

import UIKit


@IBDesignable class ImageViewBorder: UIImageView {
    override func layoutSubviews() {
        super.layoutSubviews()
        if cornerRadius == -1 {
            self.layer.cornerRadius = self.bounds.width < self.bounds.height ? self.bounds.width * 0.5 : self.bounds.height * 0.5
            self.layer.borderColor = UIColor.black.cgColor
            self.layer.borderWidth = 0.5
        }
    }
}

@IBDesignable class ViewBorder: UIVisualEffectView {
    override func layoutSubviews() {
        super.layoutSubviews()
        if cornerRadius == -1 {
            self.layer.cornerRadius = self.bounds.width < self.bounds.height ? self.bounds.width * 0.5 : self.bounds.height * 0.5
            self.layer.borderColor = UIColor.black.cgColor
            self.layer.borderWidth = 0.5
        }
    }
}

extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return CGFloat(tag)
        }
        set {
            layer.cornerRadius = newValue
            tag = Int(newValue)
            if newValue == -1 {
                self.clipsToBounds = true
                self.layer.cornerRadius = self.bounds.width < self.bounds.height ? self.bounds.width * 0.5 : self.bounds.height * 0.5
            } else {
                layer.masksToBounds = true
            }
        }
    }
}

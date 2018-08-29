//
//  CustomiableView.swift
//  DemoApp
//
//  Created by KuAnh on 02/10/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit
@IBDesignable class DesignableImageView: UIImageView {}
@IBDesignable class DesignableButton: UIButton {}
@IBDesignable class DesignableTextField: UITextField {}
@IBDesignable class DesignableView : UIView{}

@IBDesignable
extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        set {
            self.layer.cornerRadius = (bounds.size.w idth < bounds.size.height ? bounds.size.width : bounds.size.height) / 2

            self.layer.masksToBounds = true
            self.clipsToBounds = true
        } get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        } get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        } get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
    }
    
    @IBInspectable var shadowsRadius: CGFloat {
        set {
            layer.shadowRadius = newValue
        } get {
            return layer.shadowRadius
        }
    }
    
    @IBInspectable var bottomBorderWidth: CGFloat {
        get {
            return 0.0   // Just to satisfy property
        }
        set {
            let border = UIView()
            border.backgroundColor = UIColor.white
            border.frame = CGRect(x: 0.0, y: bounds.size.height, width: bounds.size.width, height: newValue)
            border.translatesAutoresizingMaskIntoConstraints = false
            border.tag = 100
            self.addSubview(border)
            let views = ["line": border]
            
            let metrics = ["lineWidth": newValue]
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "|[line]|", options: [], metrics: nil, views: views))
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[line(==lineWidth)]|", options: [], metrics: metrics, views: views))
        }
    }
    
}


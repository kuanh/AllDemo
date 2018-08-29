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
            self.layer.cornerRadius = min(bounds.width, bounds.height) * 0.5
            self.layer.masksToBounds = newValue != 0
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
    
}

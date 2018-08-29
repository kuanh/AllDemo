//
//  DesignButton.swift
//  DemoAppWifi
//
//  Created by KuAnh on 04/10/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

@IBDesignable class DesignBorderButton: UIButton {}
@IBDesignable class DesignBorderView: UIView{}
@IBDesignable class DesignBorderImage: UIImage{}
@IBDesignable class DesignLabel: UILabel{}

@IBDesignable
extension UIView {
    @IBInspectable
    var cornerRadiusButton: CGFloat {
        get {
            return layer.cornerRadius
        } set {
            self.layer.cornerRadius = newValue
            self.layer.masksToBounds = true
            self.clipsToBounds = true
        }
    }
    
    @IBInspectable
    var borderButton: CGFloat {
        get {
            return layer.borderWidth
        } set {
            self.layer.borderWidth  = newValue
        }
    }
    
    @IBInspectable
    var borderColorButton: UIColor? {
        get{
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        } set {
            if let color = newValue {
                self.layer.borderColor = color.cgColor
            } else {
                self.layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable
    var clipToBoundsLabel: UILabel? {
       set {
            self.clipsToBounds = true
        } get {
            return nil
        }
    }
}

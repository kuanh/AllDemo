//
//  Label+Extension.swift
//  DemoEarthQuake
//
//  Created by KuAnh on 04/06/2018.
//  Copyright © 2018 KuAnh. All rights reserved.
//

import UIKit

fileprivate class Keys {
    static let TOP_BORDER = "top-border"
    static let TOP_BORDER_VIEW = "top-border-view"
}

extension UILabel {
    
    @IBInspectable var cornerRadiusLabel: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            if newValue == -1 {
                self.clipsToBounds = true
                self.layer.cornerRadius = self.bounds.width < self.bounds.height ? self.bounds.width * 0.5 : self.bounds.height * 0.5
            } else {
                layer.masksToBounds = true
            }
        }
    }
    
    @IBInspectable var borderWidthLabel: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColorLabel: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable var topBorderLabel: Bool {
        get {
            if self.layer.value(forKey: Keys.TOP_BORDER) != nil {
                return self.layer.value(forKey: Keys.TOP_BORDER) as! Bool
            }
            
            return false
        }
        set {
            self.layer.setValue(newValue, forKey: Keys.TOP_BORDER)
        }
    }
    @IBInspectable var shadowColorLabel: UIColor? {
        get {
            return UIColor(cgColor: layer.shadowColor!)
        }
        set {
            layer.shadowColor = newValue?.cgColor
        }
    }
    
    @IBInspectable var shadowOpacityLabel: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    @IBInspectable var shadowOffsetLabel: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    @IBInspectable var shadowRadiusLabel: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
}

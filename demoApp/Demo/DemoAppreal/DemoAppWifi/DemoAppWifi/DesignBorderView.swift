//
//  DesignBorderView.swift
//  DemoAppWifi
//
//  Created by KuAnh on 04/10/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit
import Foundation

//public enum UIButtonBorderSide {
//    case Top, Bottom, Left, Right
//}

@IBDesignable class DesignableBorderBottomView: UIView{}

extension UIView {
    
    enum UIViewBorderSide {
        case Left, Right, Top, Bottom
    }
    
    func addBorder(side: UIViewBorderSide, color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor

        switch side {
        case .Top:
            border.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: width)
        case .Bottom:
            border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: width)
        case .Left:
            border.frame = CGRect(x: 0, y: 0, width: width, height: self.frame.size.height)
        case .Right:
            border.frame = CGRect(x: self.frame.size.width - width, y: 0, width: width, height: self.frame.size.height)
        }

        self.layer.addSublayer(border)
    }
    
    @IBInspectable
    var borderBottom: CGFloat {
        set{
            let view: UIView = UIView()
            view.addBorder(side: .Bottom, color: .white, width: 1)
        }  get {
            return layer.borderWidth
            
        }
    }
}

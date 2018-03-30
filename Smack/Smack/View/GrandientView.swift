//
//  GrandientView.swift
//  Smack
//
//  Created by xiaofei xie on 2/23/18.
//  Copyright © 2018 xiaofei xie. All rights reserved.
//

import UIKit


@IBDesignable
class GrandientView: UIView {

    @IBInspectable var topColor: UIColor = UIColor.blue {
        didSet{
            self.setNeedsLayout()
        }
    }
    
    @IBInspectable var bottomColor: UIColor = UIColor.green {
        didSet{
            self.setNeedsLayout()
        }
    }
    
    override func layoutSubviews() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [topColor.cgColor,bottomColor.cgColor]
        gradientLayer.startPoint = CGPoint(x:0,y:0)
        gradientLayer.endPoint = CGPoint(x:0,y:1)
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
    }

}

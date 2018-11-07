//
//  UIView.swift
//  KeyTresor
//
//  Created by Attila Janosi on 11/10/2018.
//  Copyright © 2018 Exera. All rights reserved.
//

import UIKit
import SnapKit

extension UIView {

    public func getTop() -> ConstraintItem{
        if #available(iOS 11.0, *) {
             return self.safeAreaLayoutGuide.snp.top
        } else {
            return self.snp.top
        }
    }
    
        // OUTPUT 1
        public func dropShadow(scale: Bool = true) {
            layer.masksToBounds = false
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowOpacity = 1
            layer.shadowOffset = CGSize(width: -1, height: 1)
            layer.shadowRadius = 2
            
            layer.shadowPath = UIBezierPath(rect: bounds).cgPath
            layer.shouldRasterize = true
            layer.rasterizationScale = scale ? UIScreen.main.scale : 1
        }
    
}

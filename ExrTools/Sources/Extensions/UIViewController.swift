//
//  UIViewController.swift
//  KeyTresor
//
//  Created by Attila Janosi on 13/10/2018.
//  Copyright © 2018 Exera. All rights reserved.
//

import UIKit

extension UIViewController {
    
    public func showLoading(onView : UIView) -> UIView {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(style: .gray)
        ai.frame = CGRect(x:0.0, y:0.0, width:80.0, height: 80.0);
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        return spinnerView
    }
    
    public func hideLoading(spinner :UIView) {
        DispatchQueue.main.async {
            spinner.removeFromSuperview()
        }
    }   
    
    public func doNothing(){
        
    }
    
}

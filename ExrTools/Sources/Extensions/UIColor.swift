//
//  UIColor.swift
//  KeyTresor
//
//  Created by Attila Janosi on 11/10/2018.
//  Copyright © 2018 Exera. All rights reserved.
//

import UIKit


extension UIColor{
    
    
    /// Alternative UIColor constructor
    ///
    ///   you can now initialize the UICoor with hex string
    ///
    /// - Parameter hex: color hex value in format of : #123456
    public convenience init(_ hex:String) {
        var cString:String = hex.trimmingCharacters(in: (NSCharacterSet.whitespacesAndNewlines as NSCharacterSet) as CharacterSet).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at:cString.startIndex)
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        var alpha: CGFloat = 1.0
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        
        if(cString.count > 6){
            alpha = CGFloat((rgbValue & 0xFF000000) >> 24) / 255.0
            red = CGFloat((rgbValue & 0x00FF0000) >> 16) / 255.0
            green = CGFloat((rgbValue & 0x0000FF00) >> 8) / 255.0
            blue = CGFloat(rgbValue & 0x000000FF) / 255.0
        }else{
            red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
            green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
            blue = CGFloat(rgbValue & 0x0000FF) / 255.0
        }
        
        
        self.init(
            red: red,
            green: green,
            blue: blue,
            alpha: alpha
        )
    }
    
    
    /// Alternative UIColor constructor
    ///
    /// - Parameters:
    ///   - rgbValue: color hex value ex. 0xRRGGBB
    ///   - alpha: color alph value (0.0 to 1.0)
    public convenience init(rgbValue:UInt32, alpha:Double = 1.0){
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        self.init(
            red: red,
            green: green,
            blue: blue,
            alpha: CGFloat(alpha)
        )
    }
    
}

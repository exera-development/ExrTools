//
//  Fonts.swift
//  ExrTools
//
//  Created by Attila Janosi on 07/11/2018.
//  Copyright © 2018 EXERA SOTDEVELOP SRL. All rights reserved.
//

import Foundation

class Font: NSObject {
    private static let MAVEN_REGULAR = R.font.mavenProRegular(size: 16)
    private static let MAVEN_BOLD = R.font.mavenProBold(size: 16)
    private static let MAVEN_MEDIUM = R.font.mavenProMedium(size: 16)
    
    public static func REGULAR()-> UIFont{
        return MAVEN_REGULAR! 
    }
    
    public static func BOLD()-> UIFont{
        return MAVEN_BOLD! 
    }
    
    public static func MEDIUM()-> UIFont{
        return MAVEN_MEDIUM! 
    }
    
} 

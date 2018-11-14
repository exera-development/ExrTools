//
//  ExrUtils.swift
//  ExrTools
//
//  Created by Attila Janosi on 14/11/2018.
//  Copyright © 2018 EXERA SOTDEVELOP SRL. All rights reserved.
//

import Foundation


/// Determines the screen size
///
/// - Returns: screen height
public func screehHeight() -> CGFloat{
    let screenSize = UIScreen.main.bounds
    let screenHeight = screenSize.height
    return screenHeight
}

/// Determines the screen size
///
/// - Returns: screen width
public func screenWidth() -> CGFloat{
    let screenSize = UIScreen.main.bounds
    let screenWidth = screenSize.width
    return screenWidth
}

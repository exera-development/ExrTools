//
//  String.swift
//  KeyTresor
//
//  Created by Attila Janosi on 16/10/2018.
//  Copyright © 2018 Exera. All rights reserved.
//

import UIKit

extension String{
    
    /// convert base64 string to string
    ///
    /// - Returns: String
    public func decodeToBase64() -> String {
        return Data(self.utf8).base64EncodedString()
    }
    
    
    /// convert string to base64 String
    ///
    /// - Returns: Base64 String
    public func encodeFromBase64() -> String? {
        guard let data = Data(base64Encoded: self) else {
            return nil
        }
        return String(data: data, encoding: .utf8)
    }
    
}

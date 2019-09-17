//
//  Date.swift
//  ExrTools
//
//  Created by Attila Janosi on 21/01/2019.
//  Copyright © 2019 EXERA SOTDEVELOP SRL. All rights reserved.
//

import UIKit

extension Date {

    ///  Convert Date to String
    ///
    /// - Parameter formatType: the date format
    /// * Example
    ///     * EEEE, MMM d, yyyy           ->      Saturday, Jan 12, 2019
    ///     * MM/dd/yyyy                  ->      01/12/2019    
    ///     * MM-dd-yyyy HH:mm            ->      01-12-2019 13:21    
    ///     * MMM d, h:mm a               ->      Jan 12, 1:21 PM    
    ///     * MMMM yyyy                   ->      January 2019    
    ///     * MMM d, yyyy                 ->      Jan 12, 2019    
    ///     * E, d MMM yyyy HH:mm:ss Z    ->      Sat, 12 Jan 2019 13:21:15 +0000    
    ///     * yyyy-MM-dd'T'HH:mm:ssZ      ->      2019-01-12T13:21:15+0000    
    ///     * dd.MM.yy                    ->      12.01.19
    ///     * HH:mm:ss.SSS                ->      13:21:15.951    
    ///
    /// - Returns: the formated string date
    public func convertToString(dateformat formatType: String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatType // Your New Date format as per requirement change it own
        let newDate: String = dateFormatter.string(from: self) 
        
        return newDate
    }
    
    
    /// Converts date to milliseconds
    public var milliseconds:Int {
        return Int((self.timeIntervalSince1970 * 1000.0).rounded())
    }
    
    /// Creates Date from milliseconds
    ///
    /// - Parameter milliseconds: milliseconds
    public init(milliseconds:Int) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds) / 1000)
    }
    
}

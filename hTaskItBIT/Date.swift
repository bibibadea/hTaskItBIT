//
//  Date.swift
//  hTaskItBIT
//
//  Created by Bibi Badea on 9/8/15.
//  Copyright © 2015 Stormbraces. All rights reserved.
//

import Foundation

class Date {
    
    class func from(year year:Int, month:Int, day:Int) -> NSDate {
        
        var components = NSDateComponents()
        components.year = year
        components.month = month
        components.day = day
        
        var gregorianCalendar = NSCalendar(identifier: NSGregorianCalendar)
        var date = gregorianCalendar?.dateFromComponents(components)
        
        return date!
    }
    
    class func toString(date date: NSDate) -> String {
        
        let dateStringFormatter = NSDateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        
        let dateString = dateStringFormatter.stringFromDate(date)
        
        return dateString
    }
    
    
}
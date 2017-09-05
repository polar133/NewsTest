//
//  DateExtension.swift
//  HackerNews
//
//  Created by Carlos Jimenez on 05-09-17.
//  Copyright © 2017 Carlos Jimenez. All rights reserved.
//

import Foundation

public extension Date {
    
    func print(format: String) -> String? {
        return DateFormatter.string(from: self, dateFormat: format, locale: Locale(identifier: "es_CL"))
    }
    
    func getTimeAgoSinceNow() -> String {
        
        let calendar = NSCalendar.current
        let unitFlags: Set<Calendar.Component> = [.minute, .hour, .day, .weekOfYear, .month, .year, .second]
        let now = NSDate()
        let earliest = now.earlierDate(self)
        let latest = (earliest == now as Date) ? self : now as Date
        let components = calendar.dateComponents(unitFlags, from: earliest as Date,  to: latest as Date)
        
        if (components.year! >= 2) {
            return "\(components.year!) years ago"
        } else if (components.year! >= 1){
            return "1 year ago"
        } else if (components.month! >= 2) {
            return "\(components.month!) months ago"
        } else if (components.month! >= 1){
            return "1 month ago"
        } else if (components.weekOfYear! >= 2) {
            return "\(components.weekOfYear!) weeks ago"
        } else if (components.weekOfYear! >= 1){
            return "1 week ago"
        } else if (components.day! >= 2) {
            return "\(components.day!) days ago"
        } else if (components.day! >= 1){
            return "1 day ago"
        } else if (components.hour! >= 2) {
            return "\(components.hour!) hours ago"
        } else if (components.hour! >= 1){
            return "1 hour ago"
        } else if (components.minute! >= 2) {
            return "\(components.minute!) minutes ago"
        } else if (components.minute! >= 1){
            return "1 minute ago"
        } else if (components.second! >= 3) {
            return "\(components.second!) seconds ago"
        } else {
            return "Just now"
        }
    }
    
}

public extension DateFormatter {
    
    private static let shared = DateFormatter()
    
    static func string(from date: Date, dateFormat: String, locale: Locale = Locale(identifier: "en_US_POSIX")) -> String? {
        shared.locale = locale
        shared.dateFormat = dateFormat
        return shared.string(from: date)
    }
    
    static func date(from string: String, dateFormat: String, locale: Locale = Locale(identifier: "en_US_POSIX")) -> Date? {
        shared.locale = locale
        shared.dateFormat = dateFormat
        return shared.date(from: string)
    }
    
}

//
//  HomeViewController.swift
//  Islamic Center App
//
//  Created by Aqeel Ahmed on 11/28/17.
//  Copyright © 2017 Mujadidia. All rights reserved.
//

import Foundation

public extension Date {

    public func getDateString(timeString: String, initialForamt: String, desiredFormat: String) -> String {
        
        guard !timeString.isEmpty || !initialForamt.isEmpty || !desiredFormat.isEmpty else {
            return ""
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.init(abbreviation: "UTC")
        dateFormatter.dateFormat = initialForamt
        
        if let date = dateFormatter.date(from: timeString) {
            dateFormatter.timeZone = NSTimeZone.local
            dateFormatter.dateFormat = desiredFormat
            return dateFormatter.string(from: date)
        } else {
            return ""
        }
    }
    
    public func getDateString(format: String) -> String {
        
        guard !format.isEmpty else {
            return ""
        }
        
        let dateFormatter = DateFormatter.init()
        dateFormatter.dateFormat = format
        let dateString = dateFormatter.string(from: self)
        return dateString
    }

    public func getDateString(format: String, timeZone: String) -> String {
        
        guard !format.isEmpty else {
            return ""
        }
        
        let dateFormatter = DateFormatter.init()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = TimeZone.init(abbreviation: timeZone)
        let dateString = dateFormatter.string(from: self)
        return dateString
    }

    
    public func getDateObject(timeString: String, format: String) -> Date {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = NSTimeZone.local
        return dateFormatter.date(from: timeString)!
    }
    
    public func dateTimeString(ofFormat format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
    public func getDateObject(timeString: String, format: String, timeZone: String) -> Date {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = TimeZone.init(abbreviation: timeZone)
        return dateFormatter.date(from: timeString)!
    }
    
    public func getIslamicDate(format: String, adjustDay: Int = 0) -> String {
        
        guard !format.isEmpty else {
            return ""
        }
        
        let adjustDate = Calendar.current.date(byAdding: .day, value: adjustDay, to: self)!
        let dateFormatter = DateFormatter.init()
        dateFormatter.calendar = Calendar.init(identifier: .islamicCivil)
        dateFormatter.dateFormat = format
        let dateString = dateFormatter.string(from: adjustDate)
        return dateString
    }

}


extension Date {
    
    static func today() -> Date {
        return Date()
    }
    
    func next(_ weekday: Weekday, considerToday: Bool = false) -> Date {
        return get(.Next,
                   weekday,
                   considerToday: considerToday)
    }
    
    func previous(_ weekday: Weekday, considerToday: Bool = false) -> Date {
        return get(.Previous,
                   weekday,
                   considerToday: considerToday)
    }
    
    func get(_ direction: SearchDirection,
             _ weekDay: Weekday,
             considerToday consider: Bool = false) -> Date {
        
        let dayName = weekDay.rawValue
        
        let weekdaysName = getWeekDaysInEnglish().map { $0.lowercased() }
        
        assert(weekdaysName.contains(dayName), "weekday symbol should be in form \(weekdaysName)")
        
        let searchWeekdayIndex = weekdaysName.index(of: dayName)! + 1
        
        let calendar = Calendar(identifier: .gregorian)
        
        if consider && calendar.component(.weekday, from: self) == searchWeekdayIndex {
            return self
        }
        
        var nextDateComponent = DateComponents()
        nextDateComponent.weekday = searchWeekdayIndex
        
        
        let date = calendar.nextDate(after: self,
                                     matching: nextDateComponent,
                                     matchingPolicy: .nextTime,
                                     direction: direction.calendarSearchDirection)
        
        return date!
    }
    
}

// MARK: Helper methods
extension Date {
    func getWeekDaysInEnglish() -> [String] {
        var calendar = Calendar(identifier: .gregorian)
        calendar.locale = Locale(identifier: "en_US_POSIX")
        return calendar.weekdaySymbols
    }
    
    enum Weekday: String {
        case monday, tuesday, wednesday, thursday, friday, saturday, sunday
    }
    
    enum SearchDirection {
        case Next
        case Previous
        
        var calendarSearchDirection: Calendar.SearchDirection {
            switch self {
            case .Next:
                return .forward
            case .Previous:
                return .backward
            }
        }
    }
}

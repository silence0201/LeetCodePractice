//
//  1185DayOfTheWeek.swift
//  Practice
//
//  Created by Silence on 2022/1/3.
//

import Foundation

class Solution {
    func dayOfTheWeek(_ day: Int, _ month: Int, _ year: Int) -> String {
        let today = "\(year)-\(month)-\(day)"
        let formatter  = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let todayDate = formatter.date(from: today)!
        let myCalendar = Calendar(identifier: .gregorian)
        let weekDay = myCalendar.component(.weekday, from: todayDate)-1
        let week = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
        return week[weekDay]
    }
    
    func dayOfWeek(_ day: Int, _ month: Int, _ year: Int) -> String {
        let week = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
        let months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30]
        
        var allDay = day
        allDay += 365 * (year - 1971) + (year - 1969) / 4
        for m in 0..<month-1 {
            allDay += months[m]
        }
        
        if ((year % 400 == 0) || (year % 4 == 0 && year % 100 != 0)) {
            if (month >= 3) {
                allDay += 1
            }
        }
        return week[(allDay + 3) % 7]
    }
}

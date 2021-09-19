//
//  DateExtension.swift
//  MyWorkout
//
//  Created by Natthaporn Wimonanupong on 10/9/2564 BE.
//

import Foundation

extension Date{
    func formatted(as format: String) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format // set format ตาม pattern ที่ส่งมา
        return dateFormatter.string(from: self) // self = Date in line 10
    }
    
    func isSameDay(ad day: Date) -> Bool{
        self.yearMonthDay == day.yearMonthDay
    }
    
    var yearMonthDay: String{
        self.formatted(as: "yyy MM dd")
    }
}

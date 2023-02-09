//
//  Date.swift
//  Status
//
//  Created by Gaetan Salvi on 09/02/2023.
//

import Foundation

extension Date {
    private func startOfMonth() -> Date? {
        return Calendar
            .current
            .date(from: Calendar.current.dateComponents([.day, .year, .month], from: Calendar.current.startOfDay(for: self)))
    }
    
    func lastDayOfMonth() -> Int? {
        if self.startOfMonth() == nil {
            return nil
        }

        let dateComponents =  Calendar
            .current
            .date(byAdding: DateComponents(month: 1, day: -1), to: self.startOfMonth()!)
        
        return Calendar.current.dateComponents([.day], from: dateComponents!).day ?? 1
    }
    
    func daysOfMonth() -> [Int] {
        if self.lastDayOfMonth() == nil {
            return []
        }
        
        return [Int](1...self.lastDayOfMonth()!)
    }
}

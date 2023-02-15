//
//  Date.swift
//  Status
//
//  Created by Gaetan Salvi on 09/02/2023.
//

import Foundation

extension Date {    
    static func getMinDateFromBirthday() -> Date {
        let date = Date()
        var dateComponents = DateComponents()
        dateComponents.year = -100
        
        return Calendar.current.date(byAdding: dateComponents, to: date) ?? date
    }
    
    static func getMaxDateFromBirthday() -> Date {
        let date = Date()
        var dateComponents = DateComponents()
        dateComponents.year = -14
        
        return Calendar.current.date(byAdding: dateComponents, to: date) ?? date
    }
}

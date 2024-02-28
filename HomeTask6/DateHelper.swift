//
//  DateHelper.swift
//  HomeTask1_No_Storyboard
//
//  Created by Павел Яновский on 28.02.2024.
//

import Foundation

final class DateHelper {
    
    static func getDate(date: Date?) -> String {
        
        guard let date = date else {
            return ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.YYYY hh:mm"
        dateFormatter.locale = Locale(identifier: "ru_RU")
        
        return dateFormatter.string(from: date)
    }
}

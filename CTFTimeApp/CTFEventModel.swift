//
//  CTFEventModel.swift
//  CTFTimeApp
//
//  Created by Nutthanon on 23/4/2567 BE.
//

import Foundation

struct CTFEventResult: Codable {
    let hits: [CTFEventsModel]?
}


struct Organizer: Codable {
    let id: Int
    let name: String
}

struct Duration: Codable {
    let hours: Int
    let days: Int
}

struct CTFEventsModel: Codable, Identifiable {

    var start_date_time: Date? {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        inputFormatter.locale = Locale(identifier: "en_US_POSIX")
        inputFormatter.timeZone = TimeZone(identifier: "Asia/Bangkok")
        
        guard let date = inputFormatter.date(from: start) else {
            return nil
        }
        
        // No need to convert to string here, just return the date
        return date
    }
    
    var start_date_string: String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"

        guard let date = inputFormatter.date(from: start) else {
            return ""
        }

        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "dd MMM, 'at' h:mm a"
        outputFormatter.locale = Locale(identifier: "en_US_POSIX")
        outputFormatter.timeZone = TimeZone(identifier: "Asia/Bangkok")

        return outputFormatter.string(from: date)
    }
    
    var finish_date_time: Date? {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        inputFormatter.locale = Locale(identifier: "en_US_POSIX")
        inputFormatter.timeZone = TimeZone(identifier: "Asia/Bangkok")
        
        guard let date = inputFormatter.date(from: finish) else {
            return nil
        }
        
        // No need to convert to string here, just return the date
        return date
    }
    
    let id: Int
    let description: String
    let weight: Float
    let title: String
    let organizers: [Organizer]
    let format: String
    let participants: Int
    let url: String
    let logo: String
    let duration: Duration
    let start: String
    let finish: String
    let ctftime_url: String
}

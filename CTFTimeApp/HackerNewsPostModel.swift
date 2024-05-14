//
//  HackerNewsPostModel.swift
//  CTFTimeApp
//
//  Created by Nutthanon on 21/4/2567 BE.
//

import Foundation

struct Result: Codable {
    let hits: [HackerNewsPostModel]?
}

struct HackerNewsPostModel: Codable, Identifiable {
    var id: String {
        return objectID
    }

    var date_time: String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"

        guard let date = inputFormatter.date(from: created_at) else {
            return ""
        }

        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "dd MMM, 'at' h:mm a"
        outputFormatter.locale = Locale(identifier: "en_US_POSIX")
        outputFormatter.timeZone = TimeZone(identifier: "Asia/Bangkok")

        return outputFormatter.string(from: date)
    }

    let objectID: String
    let title: String
    let author: String
    let points: Int
    let url: String?
    let created_at: String
}

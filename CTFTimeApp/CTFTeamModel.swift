//
//  CTFTeamModel.swift
//  CTFTimeApp
//
//  Created by Nutthanon on 4/5/2567 BE.
//

import Foundation

struct TeamData: Codable {
    let logo: String
}

struct TeamInfo: Codable {
    let team_id : Int
    let team_name: String
    let points: Double
    let teamData: TeamData?
}

//
//  Teams.swift
//  Sports News (iOS)
//
//  Created by Alex Gonzalez on 1/25/22.
//

import Foundation

struct TeamStats: Codable, Identifiable {
    let id = UUID()
    let name, streakDescription: String
    let wins, losses: Int
    let percentage: Double
 
    


    enum CodingKeys: String, CodingKey {
        case name = "Name"
        
        case wins = "Wins"
        case losses = "Losses"
        case percentage = "Percentage"
        
       
 
        case streakDescription = "StreakDescription"
        
       
    }
}


enum Conference: String, Codable {
    case eastern = "Eastern"
    case western = "Western"
}

struct StatData: Codable {
    var Stats: [TeamStats]
}


struct MLBTeam {
    let name: String
    let imageURL: String
    let score: String
    let mvp: String
    let mvpstats: String
}

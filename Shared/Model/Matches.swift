import Foundation

struct Matches: Codable {
    let data: [GameInfo]
}
// MARK: - Datum
struct GameInfo: Codable, Identifiable{
    let id = UUID()
    
   
    let homeTeam: Team
    let homeTeamScore, period: Int
    let status: String
    let visitorTeam: Team
    let visitorTeamScore: Int

    enum CodingKeys: String, CodingKey {

        case homeTeam = "home_team"
        case homeTeamScore = "home_team_score"
        case period, status
        case visitorTeam = "visitor_team"
        case visitorTeamScore = "visitor_team_score"
    }
}

// MARK: - Team
struct Team: Codable {
    
    let fullName: String
    let name: String

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case fullName = "full_name"
        
    }
}

import Foundation

enum League: String, CaseIterable {
    case all, mlb, nba
    
    static let visible: [League] = [.all, .mlb, .nba]
    
    var searchString: String {
        switch self {
        case .all: return "nba%20OR%20mlb%20AND%20-TV%20AND%20-odds%20AND%20-youngboy"
        case .mlb: return "mlb%20AND%20-TV%20AND%20-odds"
        case .nba: return "nba:%20AND%20-TV%20AND%20-odds%20AND%20-youngboy"
        }
    }
}

struct News {
    let title: String
    let imageURL: String
    let url: String
}


struct Articles: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

struct Article: Codable, Identifiable {
    let id = UUID()
    let title: String
    let articleDescription: String?
    let url: String
    let urlToImage: String?
    let publishedAt: Date

    enum CodingKeys: String, CodingKey {
        case title
        case articleDescription = "description"
        case url, urlToImage, publishedAt
    }
}


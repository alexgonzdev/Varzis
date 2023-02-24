import Foundation


final class HomeViewViewModel: ObservableObject {
    
    var network: Networking
    init(networking: Networking) {
        network = networking
    }
    @Published var articles: [Article] = []
    @Published var mainArticle: [Article] = []
    @Published var matches: [GameInfo] = []
    
    @Published var isLoading = false
    
    
    
    
    
    
    
    func fetchMatches() {
        let dateFormatter = DateFormatter()
        let date = Date()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.string(from: date)
        
        
        network.fetch(HomeMatchesEndpoint(newDate: dateString)) { [self] (result: Result<Matches, APError>) in
            DispatchQueue.main.async { [self] in
                switch result {
                    
                case .success(let games):
                    
                    self.matches = games.data.sorted { (match1, match2) -> Bool in
                        let timezoneReplace1 = match1.status.replacingOccurrences(of: "ET", with: "PST")
                        let timezoneReplace2 = match2.status.replacingOccurrences(of: "ET", with: "PST")
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "hh:mm a zzz"
                        dateFormatter.timeZone = TimeZone(abbreviation: "ET")
                        // Check if match1 status is a valid date string
                        if let date1 = dateFormatter.date(from: timezoneReplace1) {
                            // Check if match2 status is a valid date string
                            if let date2 = dateFormatter.date(from: timezoneReplace2) {
                                // Compare the two dates
                                return date1 < date2
                            } else {
                                // If match2 status is not a valid date string, put it after match1
                                return false
                            }
                        } else if let date2 = dateFormatter.date(from: timezoneReplace2) {
                            // If match1 status is not a valid date string, put it before match2
                            return true
                        } else {
                            // If neither match1 status nor match2 status are valid date strings, sort them lexicographically
                            return match1.status < match2.status
                        }
                    }
                
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    
    func fetchTopNews() {
        network.fetch(TopNewsEndpoint()) { [self] (result: Result<Articles, APError>) in
            DispatchQueue.main.async { [self] in
                switch result {
                    
                case .success(let article):
                    self.mainArticle = article.articles
                    self.fetchMatches()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
}
struct TopNewsEndpoint: APIResource {
    var path: String {
        return "/v2/top-headlines?country=us&category=sports&pageSize=1&apiKey=b2ca86c0227d4408ab170fd0aaacf239&page=2"
    }
}
struct HomeMatchesEndpoint: APIResource {
    var newDate: String?
    var host: String {
        return "balldontlie.io"
    }
    var path: String {
        guard let newDate = newDate else {
            preconditionFailure("date is required")
        }
        return "/api/v1/games?start_date=\(newDate)&end_date=\(newDate)"
    }
}


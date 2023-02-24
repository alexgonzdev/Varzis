import Foundation


final class StandingViewViewModel: ObservableObject {
    
    var network: Networking
    init(networking: Networking) {
        network = networking
    }
    
    
    @Published var eastern: [TeamStats] = []
    @Published var western: [TeamStats] = []
    
    func fetchConferenceStandings() {
        network.fetch(StandingsEndpoint()) { [self] (result: Result<[TeamStats], APError>) in
            DispatchQueue.main.async { [self] in
                switch result {
                case .success(let stats):
                    
                    for i in 0...14 {
                        self.eastern.append(stats[i])
                    }
                    self.eastern.sort {
                        $1.percentage <  $0.percentage
                    }
                    
                    for i in 15...29 {
                        self.western.append(stats[i])
                    }
                    self.western.sort {
                        $1.percentage <  $0.percentage
                    }
                    
                case .failure(let error):
                    switch error {
                    case .invalidURL:
                        print("There is an error trying to reach the server. If this persists, please contact support.")
                    case .invalidData:
                        print("Unable to complete your request at this time. Please check your internet connection.")
                    case .invalidResponse:
                        print("Invalid response from the server. Please try again or contact support.")
                    case .unableToComplete:
                        print("The data received from the server was invalid. Please try again or contact support.")
                    }
                }
            }
        }
    }
}

struct StandingsEndpoint: APIResource {
    var host: String {
        return "api.sportsdata.io"
    }
    var path: String {
        return "/v3/nba/scores/json/Standings/2023?key=9b4393a33b5f4abe9a936232288fb5dc"
    }
}

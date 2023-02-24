
import Foundation


final class ScoresViewViewModel: ObservableObject {
    @Published var scores: [GameInfo] = []
    @Published var isLoading = false
    
    var network: Networking
    init(networking: Networking) {
        network = networking
    }
    
    func fetchScores() {
        let dateFormatter = DateFormatter()
        let date = Date()
        dateFormatter.dateFormat = "2022-01-19"
        let newDate = dateFormatter.string(from: date)
        network.fetch(HomeMatchesEndpoint(newDate: newDate)) { [self] (result: Result<Matches, APError>) in
            DispatchQueue.main.async { [self] in
                switch result {
                    
                case .success(let games):
                    
                    self.scores = games.data
                    
                    self.scores.sort(by: {
                        $0.status > $1.status
                    })
                    
                case .failure(let error):
                   // //print(result)
                    print(error.localizedDescription)
                }
            }
        }
    }
}

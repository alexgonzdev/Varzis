
import Foundation


final class ScoresViewViewModel: ObservableObject {
    @Published var scores: [GameInfo] = []
    @Published var isLoading = false
    
    func getScores() {
        NetworkManager.shared.getMatches { [self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let gameresults):
                    self.scores = gameresults
                    
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

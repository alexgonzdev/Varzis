//
//  HomeViewViewModel.swift
//  Sports News (iOS)
//
//  Created by Alex Gonzalez on 1/20/22.
//

import Foundation


final class HomeViewViewModel: ObservableObject {
    @Published var articles: [Article] = []
    @Published var mainArticle: [Article] = []
    @Published var matches: [GameInfo] = []

    @Published var isLoading = false
    
    func getTopNews() {
        NetworkManager.shared.getTopNews { [self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let articles):
                    self.mainArticle = articles
                    self.getMatches()
                    
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
    
    
    
    func getMatches() {
        NetworkManager.shared.getMatches { [self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let matches):
                    self.matches = matches
                    
                case .failure(let error):
                    switch error {
                    case .invalidURL:
                        print(error.localizedDescription)
                            
                        print("There is an error trying to reach the server. If this persists, please contact support.")
                    case .invalidData:
                        print("Unable to complete your request at this time. Please check your internet connection.")
                    case .invalidResponse:
                        print(error.localizedDescription)
                        print(error.localizedDescription.debugDescription)

                        print("Invalid response from the server. Please try again or contact support.")
                    case .unableToComplete:
                        print("The data received from the server was invalid. Please try again or contact support.")
                    }
                }
            }
            
        }
    
        
    }
}

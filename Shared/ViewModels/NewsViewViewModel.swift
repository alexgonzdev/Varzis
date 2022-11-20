//
//  NewsViewViewModel.swift
//  Sports News (iOS)
//
//  Created by Alex Gonzalez on 1/28/22.
//

import Foundation
final class NewsViewViewModel: ObservableObject {
    @Published var articles: [Article] = []
    @Published var isLoading = false
    var league = League.all { didSet { getNews() }}
    
    func getNews() {
        NetworkManager.shared.getNews(for: league) { [self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let articles):
                    self.articles = articles
                    
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

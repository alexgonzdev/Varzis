//
//  StandingsViewViewModel.swift
//  Sports News (iOS)
//
//  Created by Alex Gonzalez on 1/25/22.
//

import Foundation


final class StandingViewViewModel: ObservableObject {
    @Published var eastern: [TeamStats] = []
    @Published var western: [TeamStats] = []
    
    
    func getConferenceStandings() {
        NetworkManager.shared.getTeamStats { [self] result in
            DispatchQueue.main.async {
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

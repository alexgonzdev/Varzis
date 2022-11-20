//
//  ScoresView.swift
//  Sports News (iOS)
//
//  Created by Alex Gonzalez on 1/25/22.
//

import SwiftUI

struct ScoresView: View {
    @StateObject private var viewModel = ScoresViewViewModel()
    @State var league = League.all
    var body: some View {
        
        VStack(spacing: 0) {
            topView(pageName: "SCORES")
            VStack {
                HStack {
                    NewsTypeBar(current: $league)
                    Spacer()
                }
                .padding(.leading)
                .padding(.top, 25)
            
            
           
            
            
            
            
                
                ScrollView {
                    ForEach(viewModel.scores) { game in
                        ScoreCardView(homesScore: game.homeTeamScore.description, homeName: game.homeTeam.name, awayScore: game.visitorTeamScore.description, awayName: game.visitorTeam.name, status: game.status.description)
                        
                        
                    }
                    

                }
                
            }
            .background(Color(0x252A32))
            .cornerRadius(30, corners: [.topLeft, .topRight])
            //Spacer()
        }
        .onAppear {
            viewModel.getScores()
        }
        .background(Color(0x1E232A))

                
                
            
    
}
}

struct ScoresView_Previews: PreviewProvider {
    static var previews: some View {
        ScoresView()
    }
}

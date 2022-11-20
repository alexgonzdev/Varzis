//
//  MatchesView.swift
//  Sports News (iOS)
//
//  Created by Alex Gonzalez on 1/29/22.
//

import SwiftUI

struct MatchesView: View {
    let match: GameInfo
    var body: some View {
        
        HStack {
            VStack {
                Image(match.visitorTeam.name)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
                    .padding(.bottom, 5)
                
                Text(match.visitorTeam.name)
                    .font(.system(size: 13, weight: .semibold, design: .default))
                    .foregroundColor(.white)
                    .padding(.bottom, 2)
                
            }
            .frame(width: 100)
            .padding()
            
            Text(match.status.description)
                .font(.system(size: 11, weight: .medium, design: .default))
                .foregroundColor(Color(0x616874))
                .minimumScaleFactor(0.50)
                .frame(width: 70, height: 20)
                .padding(5)
            
            
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(0x535A67), lineWidth: 1)
                )
                
            VStack {
                Image(match.homeTeam.name)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
                    .padding(.bottom, 5)
                
                Text(match.homeTeam.name)
                    .font(.system(size: 13, weight: .semibold, design: .default))
                    .foregroundColor(.white)
                    .padding(.bottom, 2)
                
                
            }
            .frame(width: 100)
            .padding()
            
        }
        
        .frame(width: 350, height: 140)
        .background(Color(0x2D333B))
        .cornerRadius(20)
        .padding()
    }
}


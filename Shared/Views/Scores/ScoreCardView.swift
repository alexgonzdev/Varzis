//
//  ScoreCardView.swift
//  Sports News (iOS)
//
//  Created by Alex Gonzalez on 1/23/22.
//

import SwiftUI

struct ScoreCardView: View {
    @State var homesScore: String
    @State var homeName: String
    
    @State var awayScore: String
    @State var awayName: String
    @State var status: String
    var body: some View {
        
        HStack {
            VStack {
                Image(awayName)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
                    .padding(.bottom, 5)

                Text(awayName)
                    .font(.system(size: 13, weight: .semibold, design: .default))
                    .foregroundColor(.white)
                    .padding(.bottom, 2)

                Text(awayScore)
                    .font(.system(size: 13, weight: .semibold, design: .default))
                    .foregroundColor(Color(0x3AB684))
                    .padding(.bottom, 1)
/*
                Text(homeTeam.mvp)
                    .font(.system(size: 11, weight: .medium, design: .default))
                    .foregroundColor(Color(0x616874))

                Text(homeTeam.mvpstats)
                    .font(.system(size: 11, weight: .medium, design: .default))
                    .foregroundColor(Color(0x616874))
                    .padding(.top, 0)
*/
                    //

            }.frame(width: 150)
            
            Text(status.description)
                .font(.system(size: 11, weight: .medium, design: .default))
                .foregroundColor(Color(0x616874))
                .minimumScaleFactor(0.50)
                .frame(width: 70, height: 20)
                .padding(5)
            
            
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(0x535A67), lineWidth: 1)
                )
                //.cornerRadius(10)
            
            VStack {
                Image(homeName)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
                    .padding(.bottom, 5)

                Text(homeName)
                    .font(.system(size: 13, weight: .semibold, design: .default))
                    .foregroundColor(.white)
                    .padding(.bottom, 2)

                Text(homesScore)
                    .font(.system(size: 13, weight: .semibold, design: .default))
                    .foregroundColor(Color(0x3AB684))
                    .padding(.bottom, 1)
/*
                Text(awayTeam.mvp)
                    .font(.system(size: 11, weight: .medium, design: .default))
                    .foregroundColor(Color(0x616874))

                Text(awayTeam.mvpstats)
                    .font(.system(size: 11, weight: .medium, design: .default))
                    .foregroundColor(Color(0x616874))
                    .padding(.top, 0)
*/
                    //

            }.frame(width: 150)

        }
        
        .frame(width: 350, height: 140)
        .background(Color(0x2D333B))
        .cornerRadius(20)
    }
}


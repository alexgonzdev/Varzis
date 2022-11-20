//
//  LeagueTypeBar.swift
//  Sports News (iOS)
//
//  Created by Alex Gonzalez on 1/26/22.
//

import SwiftUI

struct LeagueTypeBar: View {
    var body: some View {
        HStack {
       
        Text("NBA")
            .font(.system(size: 16, weight: .regular, design: .default))
            .foregroundColor(.white)
            .frame(width: 50, height: 30)
            .background(Color(0x5D1DAC))
            .cornerRadius(50)
            
            Text("MLB")
                .font(.system(size: 16, weight: .regular, design: .default))
                .foregroundColor(Color(0x717479))
                .frame(width: 50, height: 30)
                .background(Color(0x383C41))
                .cornerRadius(50)
        }
    }
}

struct LeagueTypeBar_Previews: PreviewProvider {
    static var previews: some View {
        LeagueTypeBar()
    }
}

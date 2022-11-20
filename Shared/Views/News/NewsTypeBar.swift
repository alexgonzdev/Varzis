//
//  NewsTypeBar.swift
//  Sports News (iOS)
//
//  Created by Alex Gonzalez on 1/25/22.
//

import SwiftUI

struct NewsTypeBar: View {
    @Binding var current: League
    
    let selectedColor = Color(0x5D1DAC)
    let unselectedColor = Color(0x383C41)
    var body: some View {
        HStack {
            ForEach(League.visible.indices, id: \.self) { idx in
                let league = League.visible[idx]
                let isSelected = current == league
                Text(league.rawValue.uppercased())
                    .font(.system(size: 16, weight: .bold, design: .default))
                    .foregroundColor(isSelected ? .white : Color(0x717479))
                    .frame(width: 50, height: 30)
                    .background(Capsule().fill(isSelected ? selectedColor : unselectedColor))
                    .onTapGesture {
                        withAnimation { current = league }
                    }
            }
//        Text("All")
//            .font(.system(size: 16, weight: .bold, design: .default))
//            .foregroundColor(.white)
//            .frame(width: 50, height: 30)
//            .background(Color(0x5D1DAC))
//            .cornerRadius(50)
//
//        Text("MLB")
//            .font(.system(size: 16, weight: .regular, design: .default))
//            .foregroundColor(Color(0x717479))
//            .frame(width: 50, height: 30)
//            .background(Color(0x383C41))
//            .cornerRadius(50)
//
//            Text("NBA")
//                .font(.system(size: 16, weight: .regular, design: .default))
//                .foregroundColor(Color(0x717479))
//                .frame(width: 50, height: 30)
//                .background(Color(0x383C41))
//                .cornerRadius(50)
        }
    }
}

struct NewsTypeBar_Previews: PreviewProvider {
    static var previews: some View {
        NewsTypeBar(current: .constant(.nba))
    }
}

import SwiftUI

struct StandingViewRow: View {
    let stats: TeamStats
    var body: some View {
        HStack {
            Image(stats.name)
            
                .resizable()
                .frame(width: 25, height: 25)
                .clipShape(Circle())
            
            Text(stats.name)
                .font(.system(size: 13, weight: .semibold, design: .default))
                .foregroundColor(.white)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
            Spacer()
            Text(stats.wins.description)
                .font(.system(size: 13, weight: .regular, design: .default))
                .frame(width: 40)
                .foregroundColor(.white)
            Text(stats.losses.description)
                .font(.system(size: 13, weight: .regular, design: .default))
                .frame(width: 40)
                .foregroundColor(.white)
            
            Text(stats.percentage.description)
                .font(.system(size: 13, weight: .regular, design: .default))
                .frame(width: 40)
                .foregroundColor(.white)
            
            Text(stats.streakDescription)
                .font(.system(size: 13, weight: .regular, design: .default))
                .frame(width: 40)
                .foregroundColor(.white)
            
        }
        .padding(.horizontal)
    }
}



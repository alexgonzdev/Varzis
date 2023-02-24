import SwiftUI

struct ConferenceStandingView: View {
    //var statTeams: [TeamStats] = []
    var body: some View {
        
        HStack {
            Text("Team")
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(Color(0x767E8B))
            Spacer()
            
            Text("W")
                .font(.system(size: 16, weight: .regular, design: .default))
            //.padding(.trailing)
                .foregroundColor(Color(0x767E8B))
                .frame(width: 40)
            
            Text("L")
                .font(.system(size: 16, weight: .regular, design: .default))
            //.padding(.trailing)
                .foregroundColor(Color(0x767E8B))
                .frame(width: 40)
            Text("%")
                .font(.system(size: 16, weight: .regular, design: .default))
                .frame(width: 40)
                .foregroundColor(Color(0x767E8B))
            
            
            Text("STRK")
                .font(.system(size: 14, weight: .regular, design: .default))
                .frame(width: 40)
            
            //.padding(.trailing)
                .foregroundColor(Color(0x767E8B))
        }
        
        .padding(.horizontal)
        
    }
}

struct ConferenceStandingView_Previews: PreviewProvider {
    static var previews: some View {
        ConferenceStandingView()
    }
}

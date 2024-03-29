import SwiftUI

struct StandingView: View {
    @ObservedObject var viewModel = StandingViewViewModel(networking: Network())
    @State var league = League.all

    var body: some View {
        VStack(spacing: 0) {
            topView(pageName: "STANDINGS")

            
            VStack {
            HStack {
                NewsTypeBar(current: $league)
                Spacer()
            }
            .padding(.leading)
                if self.league == .mlb {
                    Text("In the offseason now").foregroundColor(.white)
                    Spacer()
                } else {
                    ScrollView {
                        HStack {
                            Text("Eastern Conference")
                                .font(.system(size: 17, weight: .bold, design: .default))
                                .foregroundColor(.white)
                            Spacer()
                        }
                        .padding(.leading)
                        easternstanding()
                            .padding(.horizontal)
                        
                        HStack {
                            Text("Western Conference")
                                .font(.system(size: 17, weight: .bold, design: .default))
                                .foregroundColor(.white)
                            Spacer()
                        }
                        .padding(.leading)
                        
                        westernstanding()
                            .padding(.horizontal)
                    }
                }
        }
            .padding(.top)
        
        .background(Color(0x252A32))
        .cornerRadius(30, corners: [.topLeft, .topRight])
            //Spacer()

           
    }
        .background(Color(0x1E232A))
        //.onAppear {viewModel.fetchConferenceStandings()}

        
    }
    
}


struct easternstanding: View {
    @StateObject private var viewModel = StandingViewViewModel(networking: Network())

    var body: some View {
        VStack {
            
        ConferenceStandingView()
                .padding(.top)
            ScrollView {
            ForEach(viewModel.eastern) { team in
                StandingViewRow(stats: team)
                
                
            }.onAppear {viewModel.fetchConferenceStandings()}
                
            }
        }
        .frame(height: 600)
        
        .background(Color(0x2D333B))
        .cornerRadius(20, corners: [.allCorners])
        
    }
}

struct westernstanding: View {
    @StateObject private var viewModel = StandingViewViewModel(networking: Network())

    var body: some View {
        VStack {
            
        ConferenceStandingView()
                .padding(.top)
            ScrollView {
            ForEach(viewModel.western) { team in
                StandingViewRow(stats: team)
                
                
            }.onAppear {viewModel.fetchConferenceStandings()}
                
            }
        }
        .frame(height: 600)
        
        .background(Color(0x2D333B))
        .cornerRadius(20, corners: [.allCorners])
        
    }
}

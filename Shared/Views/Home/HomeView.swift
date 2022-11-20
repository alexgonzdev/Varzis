//
//  Home.swift
//  Sports News (iOS)
//
//  Created by Alex Gonzalez on 1/13/22.
//

import SwiftUI
import BetterSafariView
struct Home: View {
    @State var text = ""
    @State var isEditing = false
    @StateObject private var viewModel = HomeViewViewModel()
    @State var opensafari = false
    var body: some View {
        VStack(spacing: 0) {
            topView(pageName: "HOME")
            VStack {
                ScrollView {
                    ForEach(viewModel.mainArticle) { article in
                        featured(title: article.title, imageurl: article.urlToImage?.description ?? "https://www.eduprizeschools.net/wp-content/uploads/2016/06/No_Image_Available.jpg", url: article.url)
                    }
                    .padding(.vertical)
                    HStack {
                        Text("Upcoming Matches")
                            .font(.system(size: 17, weight: .bold, design: .default))
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding(.leading)
                    ForEach(viewModel.matches) { match in
                        MatchesView(match: match)
                    }
                }
            }
            .background(Color(0x252A32))
            .cornerRadius(30, corners: [.topLeft, .topRight])
        }
        .onAppear {
            viewModel.getTopNews()
        }
        .background(Color(0x1E232A))
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

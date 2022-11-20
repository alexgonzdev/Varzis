//
//  NavTest.swift
//  Sports News (iOS)
//
//  Created by Alex Gonzalez on 1/3/22.
//

import SwiftUI

struct NewsView: View {
    @StateObject private var viewModel = NewsViewViewModel()
    @State var league = League.all

    var body: some View {
       
        VStack(spacing: 0) {
                topView(pageName: "NEWS")
                VStack {
                    HStack {
                        NewsTypeBar(current: $viewModel.league)
                        Spacer()
                    }
                    .padding(.leading)
                    .padding(.top, 25)
                
                
               
                
                
                
                
                    
                    ScrollView {
                        
                        ForEach(viewModel.articles) { article in
                            
                            NewsTabCView(text: article.title, image: article.urlToImage?.description ?? "https://www.eduprizeschools.net/wp-content/uploads/2016/06/No_Image_Available.jpg", url: article.url)
                                .padding()
                            
                        }
                        
                    }
                    
                }
                .background(Color(0x252A32))
                .cornerRadius(30, corners: [.topLeft, .topRight])
                //Spacer()
            }
        
            .onAppear {
                viewModel.getNews()
            }
            .background(Color(0x1E232A))

                    
                    
                
        
    }
}



struct NavTest_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}




extension View {
    
    
    @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }
}

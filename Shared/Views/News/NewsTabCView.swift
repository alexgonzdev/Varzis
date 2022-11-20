//
//  NewsView.swift
//  Sports News (iOS)
//
//  Created by Alex Gonzalez on 12/23/21.
//

import SwiftUI
import CachedAsyncImage
import BetterSafariView
struct NewsTabCView: View {
    
    @State var text: String
    @State var image: String
    @State var url: String
    @State private var opensafari = false
    var body: some View {
        VStack {
            VStack() {
            Text(text)
                .foregroundColor(.white)
                .font(.system(size: 16, weight: .bold, design: .default))
                .multilineTextAlignment(.leading)
                .frame(width: 320, alignment: .leading)
                .lineLimit(3)
               
                //.fixedSize(horizontal: false, vertical: false)



                CachedAsyncImage(url: URL(string: image)) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView().frame(width: 10)
                                        .frame(width: 320, height: 200)
                                    
                                        
                                case .success(let image):
                                    image.resizable()
                                        //.aspectRatio(contentMode: .fit)
                                        .cornerRadius(5)
                                        .frame(width: 320, height: 200)
                                case .failure:
                                    Image(systemName: "photo")
                                        .resizable()
                                        .frame(width: 320, height: 200)
                                @unknown default:
                                    // Since the AsyncImagePhase enum isn't frozen,
                                    // we need to add this currently unused fallback
                                    // to handle any new cases that might be added
                                    // in the future:
                                    EmptyView()
                                        
                                }
                            }
                
                .onTapGesture {
                    opensafari = true
                }
                
            }
            .padding()
            
            
            HStack {
                HStack {
                    
                    Image("paper")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        .onTapGesture {
                            shareButton(url: url) { (result) in
                                //MARK: - you will be navigate here with RESULT after completiong the work of handler function
                                print("RESULT : \(result)")
                            }
                        }
                    Text("Share")
                        .font(.system(size: 13, weight: .medium, design: .default))
                        .foregroundColor(Color(0x7D838E))
                        
                    
                   
                }
                .padding(.leading)
                Spacer()
                
                .padding(.trailing)
               
            }
            .padding(.bottom)
        }
        
            .background(Color(0x2D333C))
        
            .cornerRadius(20)
        
        
            .safariView(isPresented: $opensafari) {
                        SafariView(
                            url: URL(string: url)!,
                            configuration: SafariView.Configuration(
                                entersReaderIfAvailable: false,
                                barCollapsingEnabled: true
                            )
                        )
                        .preferredBarAccentColor(.clear)
                        .preferredControlAccentColor(.accentColor)
                        .dismissButtonStyle(.done)
                
            }
    }
    
       
}






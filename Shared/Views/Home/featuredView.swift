//
//  featured.swift
//  Sports News (iOS)
//
//  Created by Alex Gonzalez on 1/15/22.
//

import SwiftUI
import CachedAsyncImage
import BetterSafariView
struct featured: View {
    let title: String
    let imageurl: String
    let url: String
    @State private var opensafari = false
    var body: some View {
        ZStack {
            CachedAsyncImage(url: URL(string: imageurl)) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                                .frame(width: 358, height: 240)
                            case .success(let image):
                                image.resizable()
                                    .scaledToFill()
                                    .frame(width: 358, height: 240)
                                    .cornerRadius(10)
                                    .opacity(0.5)
                            case .failure:
                                Image(systemName: "photo")
                                    .resizable()
                                    .frame(width: 358, height: 240)
                            @unknown default:
                                // Since the AsyncImagePhase enum isn't frozen,
                                // we need to add this currently unused fallback
                                // to handle any new cases that might be added
                                // in the future:
                                EmptyView()
                                    .frame(width: 358, height: 240)
                            }
                        }
            .onTapGesture {
                opensafari = true
            }
            VStack {
                Spacer()
                HStack {
                    Text("Featured")
                        .font(.system(size: 16, weight: .medium, design: .default))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                    Spacer()
                }
                .padding(.leading)
                HStack {
                    Text(title)
                        .font(.system(size: 16, weight: .bold, design: .default))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                    Spacer()
                }
                .padding(.leading)
                .padding(.bottom, 20)
            }
        }
        .frame(width: 358, height: 240)
        .cornerRadius(10)
        .padding(.horizontal)
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



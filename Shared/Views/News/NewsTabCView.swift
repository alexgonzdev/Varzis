import SwiftUI
import CachedAsyncImage
import BetterSafariView
struct NewsTabCView: View {
    
    @State var text: String
    @State var image: String
    @State var url: String
    let imgWidth = UIScreen.screenWidth * 0.846
    let imgHeight = UIScreen.screenHeight * 0.284
    @State private var opensafari = false
    var body: some View {
        VStack {
            ZStack{
                CachedAsyncImage(url: URL(string: image)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: imgWidth, height: imgHeight)
                    case .success(let img):
                        img.resizable()
                            .scaledToFill()
                            .frame(width: imgWidth, height: imgHeight)
                            .cornerRadius(10)
                            .opacity(0.5)
                    case .failure:
                        Image(systemName: "photo")
                            .resizable()
                            .frame(width: imgWidth, height: imgHeight)
                    @unknown default:
                        // Since the AsyncImagePhase enum isn't frozen,
                        // we need to add this currently unused fallback
                        // to handle any new cases that might be added
                        // in the future:
                        EmptyView()
                            .frame(width: imgWidth, height: imgHeight)
                    }
                }
                .onTapGesture {
                    opensafari = true
                }
                VStack {
                    Spacer()
                    
                    HStack {
                        Text(text)
                            .font(.system(size: 15, weight: .bold, design: .default))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                            .lineLimit(3)
                            .minimumScaleFactor(0.5)
                        Spacer()
                    }
                    .padding(.leading)
                    .padding(.bottom, 20)
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
                                //print("RESULT : \(result)")
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


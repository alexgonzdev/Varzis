import SwiftUI

import SwiftUI

struct tabbar: View {
    @StateObject var viewRouter: ViewRouter
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                //Spacer()
                switch viewRouter.currentPage {
                case .home:
                    Home()
                case .news:
                    NewsView()
                case .score:
                    ScoresView()
                case .standing:
                    StandingView()
                }
                
                ZStack {
                    HStack() {
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .home, width: geometry.size.width / 4.5, height: geometry.size.height / 28, iconname:"home2", iconname2: "home1")
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .news, width: geometry.size.width / 4.5, height: geometry.size.height / 28, iconname:"news2", iconname2: "news1")
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .score, width: geometry.size.width / 4.5, height: geometry.size.height / 28, iconname:"score2", iconname2: "score1")
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .standing, width: geometry.size.width / 4.5, height: geometry.size.height / 28, iconname:"leader2", iconname2: "leader1")
                    }
                    .padding(.top, 20)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color(0x292F37))
                }
            }
        }
        .background(Color(0x292F37))
    }
}


struct TabBarIcon: View {
    @StateObject var viewRouter: ViewRouter
    let assignedPage: Page
    let width, height: CGFloat
    @State var iconname: String
    @State var iconname2: String
    var body: some View {
            Image(viewRouter.currentPage == assignedPage ? iconname : iconname2)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
                .padding(.bottom, 10)
            .onTapGesture {
                viewRouter.currentPage = assignedPage
            }
    }
}

struct tabbar_Previews: PreviewProvider {
    static var previews: some View {
        tabbar(viewRouter: ViewRouter())
        //    .preferredColorScheme(.light)
    }
}

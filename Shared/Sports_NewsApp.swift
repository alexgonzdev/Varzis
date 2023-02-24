import SwiftUI

@main
struct Sports_NewsApp: App {
    @StateObject var viewRouter = ViewRouter()
       
       var body: some Scene {
           WindowGroup {
               tabbar(viewRouter: viewRouter).statusBar(hidden: true)
           }
       }
}

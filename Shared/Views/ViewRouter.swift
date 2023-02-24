import SwiftUI

class ViewRouter: ObservableObject {
    @Published var currentPage: Page = .home
}
enum Page {
    case home
    case news
    case score
    case standing
}

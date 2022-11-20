//
//  SwiftUIView.swift
//  Sports News (iOS)
//
//  Created by Alex Gonzalez on 1/16/22.
//

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

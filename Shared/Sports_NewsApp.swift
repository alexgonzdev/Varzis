//
//  Sports_NewsApp.swift
//  Shared
//
//  Created by Alex Gonzalez on 12/15/21.
//

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

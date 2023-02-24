//
//  Paths.swift
//  Sports News (iOS)
//
//  Created by Alex Gonzalez on 1/10/23.
//

import Foundation


enum Paths: String {
    case topnews = "/v2/top-headlines?country=us&category=sports&pageSize=1&apiKey=b2ca86c0227d4408ab170fd0aaacf239"
    case categories = "categories.php"
    case filter = "filter.php?c="
}

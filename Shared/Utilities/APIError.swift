//
//  APIError.swift
//  Sports News (iOS)
//
//  Created by Alex Gonzalez on 1/20/22.
//

import Foundation
enum APError: Error {
    case invalidURL
    case unableToComplete
    case invalidResponse
    case invalidData
}

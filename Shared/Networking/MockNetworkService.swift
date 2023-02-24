//
//  MockNetworkService.swift
//  Sports News (iOS)
//
//  Created by Alex Gonzalez on 1/29/23.
//

import Foundation

class MockService: Networking {

    func fetch<T>(jsonString: String, completion: @escaping (Result<T, APError>) -> Void) where T : Decodable {
        
        let jsonData = jsonString.data(using: .utf8)!
        do {
            let decoder = JSONDecoder()
            let decodedResponse = try decoder.decode(T.self, from: jsonData)
            completion(.success(decodedResponse))
        } catch {
            print(String(describing: error))
            completion(.failure(.invalidData))
        }
        
    }
}

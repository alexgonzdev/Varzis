//
//  NewNetworkManager.swift
//  Sports News (iOS)
//
//  Created by Alex Gonzalez on 1/10/23.
//

import Foundation

protocol APIResource {
    var scheme: String { get }
    var path: String { get }
    var host: String { get }
}
extension APIResource {
    var scheme: String {
        return "https"
    }
    var host: String {
        return "newsapi.org"
    }
}

protocol Networking {
        func fetch<T: Decodable>(_ endpoint: APIResource, completion: @escaping (Result<T, APError>) -> Void)
}

extension Networking {
    func fetch<T: Decodable>(_ endpoint: APIResource, completion: @escaping (Result<T, APError>) -> Void) {
        var urlComponents = URLComponents()
        urlComponents.scheme = endpoint.scheme
        urlComponents.host = endpoint.host
        urlComponents.path = endpoint.path
        
        
        guard let urlString = urlComponents.url?.description else {
            preconditionFailure("Url is not valid")
        }
        //print(urlString)
        guard let url = URL(string: urlString.removingPercentEncoding!) else {
            preconditionFailure("Url is not valid")
        }
        //print(url.description)
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let _ =  error {
                //print(error?.localizedDescription)
                completion(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print(error.debugDescription)
                print(response)
                completion(.failure(.invalidResponse))
                return
            }
            
            print(response.statusCode)
            //print(String(data: data!, encoding: .utf8)!)
            
            
            guard let data = data else {
                let text = String(decoding: data!, as: UTF8.self)
                //print(text)
                //print(error?.localizedDescription)
                let str = String(decoding: data!, as: UTF8.self)
                //print(str)
                completion(.failure(.invalidData))
                return
            }
            
            
            
                do {
                    
                    let decoder = JSONDecoder()
                    let dateFormatter = DateFormatter()
                    dateFormatter.calendar = Calendar(identifier: .iso8601)
                    //dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
                    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

                    
                    decoder.dateDecodingStrategy = .formatted(dateFormatter)
                    let decodedResponse = try decoder.decode(T.self, from: data)
                    completion(.success(decodedResponse))
                } catch {
                    //print(String(describing: error))
                    completion(.failure(.invalidData))
                }
                
        }
        task.resume()
    }
}


struct Network: Networking {}

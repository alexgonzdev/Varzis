//
//  NetworkManager.swift
//  Sports News (iOS)
//
//  Created by Alex Gonzalez on 1/20/22.
//
//b2ca86c0227d4408ab170fd0aaacf239
//40ae27dc164340af9e671e828e7faf01
import Foundation

import UIKit

class NetworkManager: NSObject {
    
    static let shared = NetworkManager()
    
    var tempPath: URL { URL(fileURLWithPath: NSTemporaryDirectory()) }
    func getData(with request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        guard let filename = request.url?.lastPathComponent else {
            completion(nil, nil, nil)
            return
        }
        let localPath = tempPath.appendingPathComponent(filename)
        if let data = try? Data(contentsOf: localPath) {
            completion(data, nil, nil)
        } else {
            let task = URLSession.shared.dataTask(with: request, completionHandler: completion)
            task.resume()
        }
    }
    
    private override init() {}
    
    func getTopNews(completed: @escaping (Result<[Article], APError>) -> Void) {
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=sports&pageSize=1&apiKey=40ae27dc164340af9e671e828e7faf01") else {
            completed(.failure(.invalidURL))
            return
        }
               
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in

            
            if let _ =  error {
                
                completed(.failure(.unableToComplete))
                
                return
            }
                        
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print(error.debugDescription)
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                let str = String(decoding: data!, as: UTF8.self)
                print(str)
                print(error?.localizedDescription)
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let dateFormatter = DateFormatter()
                dateFormatter.calendar = Calendar(identifier: .iso8601)
                dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

                
                decoder.dateDecodingStrategy = .formatted(dateFormatter)
                let decodedResponse = try decoder.decode(Welcome.self, from: data)
                completed(.success(decodedResponse.articles))
            } catch {
                print(String(describing: error))
                completed(.failure(.invalidData))
            }
        }
        task.resume()
        
        
    }
    
    
    
    func getNews(for league: League, completed: @escaping (Result<[Article], APError>) -> Void) {
        guard let url = URL(string: "https://newsapi.org/v2/everything?qInTitle=\(league.searchString)&sortBy=publishedAt&language=en&pageSize=10&apiKey=b2ca86c0227d4408ab170fd0aaacf239") else {
            completed(.failure(.invalidURL))
            return
        }
               
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in

            if let _ =  error {
                
                completed(.failure(.unableToComplete))
                
                return
            }
                        
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                let rr = response as? HTTPURLResponse
                print(rr?.statusCode)
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                let str = String(decoding: data!, as: UTF8.self)
                print(str)
                print(error?.localizedDescription)
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let dateFormatter = DateFormatter()
                dateFormatter.calendar = Calendar(identifier: .iso8601)
                dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

                
                decoder.dateDecodingStrategy = .formatted(dateFormatter)
                let decodedResponse = try decoder.decode(Welcome.self, from: data)
                completed(.success(decodedResponse.articles))
            } catch {
                print(String(describing: error))
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    
    }
    
    func getTeamStats(completed: @escaping (Result<[TeamStats], APError>) -> Void) {
        guard let url = URL(string: "https://api.sportsdata.io/v3/nba/scores/json/Standings/2023?key=859db0b46ce34f3da397d718389f341a") else {
            completed(.failure(.invalidURL))
            return
        }
               
        getData(with: URLRequest(url: url)) { data, response, error in
            
            if let _ =  error {
                
                completed(.failure(.unableToComplete))
                
                return
            }
                        
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                let str = String(decoding: data!, as: UTF8.self)
                print(str)
                print(error?.localizedDescription)
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
               

                
                let decodedResponse = try decoder.decode([TeamStats].self, from: data)
                completed(.success(decodedResponse))
            } catch {
                print(String(describing: error))
                completed(.failure(.invalidData))
            }
        }
        
    }
    
    func getMatches(completed: @escaping (Result<[GameInfo], APError>) -> Void) {
        let dateFormatter = DateFormatter()
        let date = Date()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let newDate = dateFormatter.string(from: date)
        guard let url = URL(string: "https://www.balldontlie.io/api/v1/games?start_date=\(newDate)&end_date=\(newDate)") else {
            completed(.failure(.invalidURL))
            return
        }
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy)
        request.httpMethod = "GET"
        //request.allHTTPHeaderFields = headers
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let _ =  error {
                completed(.failure(.unableToComplete))
                return
            }
                        
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                let rr = response as? HTTPURLResponse
                print(rr?.statusCode.description)
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                let str = String(decoding: data!, as: UTF8.self)
                print(str)
                print(error?.localizedDescription)
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
               // let dateFormatter = DateFormatter()
                //dateFormatter.calendar = Calendar(identifier: .iso8601)
                //dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
                //dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

                
               // decoder.dateDecodingStrategy = .formatted(dateFormatter)
                let decodedResponse = try decoder.decode(Matches.self, from: data)
                completed(.success(decodedResponse.data))
            } catch {
                print(String(describing: error))
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
    
   
    
    
}



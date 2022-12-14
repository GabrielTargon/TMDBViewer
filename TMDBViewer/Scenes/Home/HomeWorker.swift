//
//  HomeWorker.swift
//  TMDBViewer
//
//  Created by Gabriel Targon on 19/10/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import Foundation

class HomeWorker: NetworkConsumer {
    
    func fetchMovies(endpoint: Home.Endpoint,
                     params: [String: String]? = nil,
                     result: @escaping (Result<MoviesResponse, Error>) -> Void) {
        guard var urlComponents = URLComponents(string: "\(baseAPIURL)/movie/\(endpoint.rawValue)") else {
            result(.failure(MovieError.invalidEndpoint))
            return
        }
        
        var queryItems = [URLQueryItem(name: "api_key", value: apiKey)]
        if let params = params {
            queryItems.append(contentsOf: params.map { URLQueryItem(name: $0.key, value: $0.value) })
        }
        urlComponents.queryItems = queryItems
        
        guard let url = urlComponents.url else {
            result(.failure(MovieError.invalidEndpoint))
            return
        }
        
        urlSession.dataTask(with: url) { (data, response, error) in
            if error != nil {
                result(.failure(MovieError.apiError))
                return
            }
            
            guard let data = data else {
                result(.failure(MovieError.noData))
                return
            }
            
            do {
                let moviesResponse = try self.jsonDecoder.decode(MoviesResponse.self, from: data)
                DispatchQueue.main.async {
                    result(.success(moviesResponse))
                }
            } catch {
                result(.failure(MovieError.serializationError))
            }
        }.resume()
    }
}

//
//  DetailWorker.swift
//  TMDBViewer
//
//  Created by Gabriel Targon on 20/10/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import Foundation

class DetailWorker: NetworkConsumer {
    
    func fetchMovie(id: Int,
                    result: @escaping (Result<Movie, Error>) -> Void) {
        guard let url = URL(string: "\(baseAPIURL)/movie/\(id)?api_key=\(apiKey)&append_to_response=videos,credits") else {
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
                let movie = try self.jsonDecoder.decode(Movie.self, from: data)
                DispatchQueue.main.async {
                    result(.success(movie))
                }
            } catch {
                result(.failure(MovieError.serializationError))
            }
        }.resume()
    }
}
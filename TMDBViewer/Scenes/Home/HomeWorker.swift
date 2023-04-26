//
//  HomeWorker.swift
//  TMDBViewer
//
//  Created by Gabriel Targon on 19/10/22.
//

import Foundation

protocol HomeWorkLogic {
    func fetchMovies(endpoint: Home.Endpoint,
                     params: [String: String]?,
                     result: @escaping (Result<MoviesResponse, NetworkError>) -> Void)
}

class HomeWorker: HomeWorkLogic {
    
    func fetchMovies(endpoint: Home.Endpoint,
                     params: [String: String]?,
                     result: @escaping (Result<MoviesResponse, NetworkError>) -> Void) {
        
        let endpoint = TMDBEndpoint(path: "movie/\(endpoint.rawValue)",
                                    method: .get)
        
        NetworkService.makeRequest(endpoint) { (response: Result<MoviesResponse, NetworkError>) in
            switch response {
            case .success(let data):
                result(.success(data))
            case.failure(let error):
                result(.failure(error))
            }
        }
    }
}

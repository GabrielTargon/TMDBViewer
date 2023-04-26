//
//  DetailWorker.swift
//  TMDBViewer
//
//  Created by Gabriel Targon on 20/10/22.
//

import Foundation

protocol DetailWorkLogic {
    func fetchMovie(id: Int,
                    result: @escaping (Result<Movie, NetworkError>) -> Void)
}

class DetailWorker: DetailWorkLogic {
    
    func fetchMovie(id: Int,
                    result: @escaping (Result<Movie, NetworkError>) -> Void) {
        
        var endpoint = TMDBEndpoint(path: "movie/\(id)",
                                    method: .get)
        endpoint.parameters = ["append_to_response" : "credits"]
        
        NetworkService.makeRequest(endpoint) { (response: Result<Movie, NetworkError>) in
            switch response {
            case .success(let data):
                result(.success(data))
            case.failure(let error):
                result(.failure(error))
            }
        }
    }
}

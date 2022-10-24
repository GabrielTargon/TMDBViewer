//
//  NetworkConsumer.swift
//  TMDBViewer
//
//  Created by Gabriel Targon on 20/10/22.
//

import Foundation

protocol NetworkWrapperConsumerProtocol: AnyObject {}

class NetworkConsumer: NetworkWrapperConsumerProtocol {
    let apiKey = "xxxxxxx"
    let baseAPIURL = "https://api.themoviedb.org/3"
    let urlSession = URLSession.shared
    
    let jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
        return jsonDecoder
    }()
}

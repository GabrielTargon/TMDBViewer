//
//  NetworkError.swift
//  TMDBViewer
//
//  Created by Gabriel Targon on 22/02/23.
//

import Foundation

enum NetworkError: Error {
    case noConnection
    case decodeError
    case invalidURL
    case unknown
    case invalidResponse
}

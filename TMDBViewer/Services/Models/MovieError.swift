//
//  MovieError.swift
//  TMDBViewer
//
//  Created by Gabriel Targon on 24/10/22.
//

import Foundation

public enum MovieError: Error {
    case apiError
    case invalidEndpoint
    case invalidResponse
    case noData
    case serializationError
}

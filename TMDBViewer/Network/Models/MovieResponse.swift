//
//  MovieResponse.swift
//  TMDBViewer
//
//  Created by Gabriel Targon on 24/10/22.
//

import Foundation

public struct MoviesResponse: Codable {
    public let page: Int
    public let totalResults: Int
    public let totalPages: Int
    public let results: [Movie]
}

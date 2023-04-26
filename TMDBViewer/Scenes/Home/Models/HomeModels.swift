//
//  HomeModels.swift
//  TMDBViewer
//
//  Created by Gabriel Targon on 19/10/22.
//

import UIKit

enum Home {
    // MARK: Use cases
    
    enum Movies {
        struct Request {
            let endpoint: Endpoint
        }
        
        struct Response {
            let movies: MoviesResponse
        }
        
        struct ViewModel {
            var movies: [Movie]
        }
    }
    
    struct Movie {
        var id: Int
        var image: URL
        var title: String
        var date: String
        var rating: String
        var description: String
    }
    
    enum Endpoint: String, CaseIterable {
        case nowPlaying = "now_playing"
        case upcoming
        case popular
        case topRated = "top_rated"
    }
}

//
//  DetailModels.swift
//  TMDBViewer
//
//  Created by Gabriel Targon on 20/10/22.
//

import UIKit

enum Detail {
    
    enum Film {
        struct Request {
            let id: Int
        }
        
        struct Response {
            let movie: Movie
        }
        
        struct ViewModel {
            var id: Int
            var backdropImageURL: URL
            var title: String
            var rate: String
            var date: String
            var description: String
            var genres: String
            var cast: String
        }
    }
}

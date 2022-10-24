//
//  DetailModels.swift
//  TMDBViewer
//
//  Created by Gabriel Targon on 20/10/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
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
            var genres: [MovieGenre]?
            var cast: MovieCreditResponse?
        }
    }
}

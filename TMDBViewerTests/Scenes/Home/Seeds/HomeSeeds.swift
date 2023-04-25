//
//  HomeSeeds.swift
//  TMDBViewerTests
//
//  Created by Gabriel Targon on 19/04/23.
//

@testable import TMDBViewer
import Foundation

struct HomeSeeds {
    
    static let moviesResponseStub: MoviesResponse = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        return GenericDecoder.decoded(file: "MoviesResponse",
                                      decoder: decoder,
                                      bundle: Bundle(for: HomeViewControllerTests.self))
    }()
    
    static let movies: [Home.Movie] = {
        var movies = [Home.Movie]()
        
        for movie in moviesResponseStub.results {
            movies.append(Home.Movie(id: movie.id,
                                     image: movie.posterURL,
                                     title: movie.title,
                                     date: movie.releaseDate.getFormattedDate(format: "MMM d, yyyy"),
                                     rating: "★ " + movie.voteAverage.description,
                                     description: movie.overview))
        }
        
        return movies
    }()
    
    static let endpointStub: Home.Endpoint = {
        return Home.Endpoint.nowPlaying
    }()
}

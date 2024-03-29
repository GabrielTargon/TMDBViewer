//
//  HomePresenter.swift
//  TMDBViewer
//
//  Created by Gabriel Targon on 19/10/22.
//

import UIKit

protocol HomePresentationLogic {
    func presentMovies(response: Home.Movies.Response)
    func presentError(description: String)
}

class HomePresenter: HomePresentationLogic {
    weak var viewController: HomeDisplayLogic?
    
    // MARK: Present functions
    
    func presentMovies(response: Home.Movies.Response) {
        var movies = [Home.Movie]()
        
        for movie in response.movies.results {
            movies.append(Home.Movie(id: movie.id,
                                     image: movie.posterURL,
                                     title: movie.title,
                                     date: movie.releaseDate.getFormattedDate(format: "MMM d, yyyy"),
                                     rating: "★ " + movie.voteAverage.description,
                                     description: movie.overview))
        }
        
        let viewModel = Home.Movies.ViewModel(movies: movies)
        viewController?.displayMovies(viewModel: viewModel)
    }
    
    func presentError(description: String) {
        viewController?.displayError(description: description)
    }
}

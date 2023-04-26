//
//  DetailPresenter.swift
//  TMDBViewer
//
//  Created by Gabriel Targon on 20/10/22.
//

import UIKit

protocol DetailPresentationLogic {
    func presentMovie(response: Detail.Film.Response)
    func presentError(description: String)
}

class DetailPresenter: DetailPresentationLogic {
    weak var viewController: DetailDisplayLogic?
    
    // MARK: Present functions
    
    func presentMovie(response: Detail.Film.Response) {
        let movie = response.movie
        let viewModel = Detail.Film.ViewModel(id: movie.id,
                                              backdropImageURL: movie.backdropURL,
                                              title: movie.title,
                                              rate: String(format: "%.1f", movie.voteAverage),
                                              date: movie.releaseDate.getFormattedDate(format: "d MMMM yyyy"),
                                              description: movie.overview,
                                              genres: formatGenresWith(genre: movie.genres),
                                              cast: formatCastWith(credits: movie.credits))
        viewController?.displayMovieInfo(viewModel: viewModel)
    }
    
    func presentError(description: String) {
        viewController?.displayError(description: description)
    }
    
    // MARK: Formaters
    
    private func formatGenresWith(genre: [MovieGenre]?) -> String {
        guard let genre = genre else {
            return "-"
        }
        
        var genreString = String()
        
        for gen in genre {
            genreString.append(gen.name + " / ")
        }
        
        return genreString
    }
    
    private func formatCastWith(credits: MovieCreditResponse?) -> String {
        guard let credit = credits else {
            return "-"
        }
        
        var castString = String()
        
        for actor in credit.cast {
            castString.append(actor.name + " as " + actor.character + "\n")
        }
        
        return castString
    }
}

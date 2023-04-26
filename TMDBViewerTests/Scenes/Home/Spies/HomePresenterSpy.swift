//
//  HomePresenterSpy.swift
//  TMDBViewerTests
//
//  Created by Gabriel Targon on 23/04/23.
//

@testable import TMDBViewer

final class HomePresenterSpy {
    var presentMoviesCalled = false
    var presentErrorCalled = false
}

extension HomePresenterSpy: HomePresentationLogic {
    func presentMovies(response: TMDBViewer.Home.Movies.Response) {
        presentMoviesCalled = true
    }
    
    func presentError(description: String) {
        presentErrorCalled = true
    }
}

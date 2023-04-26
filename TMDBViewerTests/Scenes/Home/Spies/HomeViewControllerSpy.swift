//
//  HomeViewControllerSpy.swift
//  TMDBViewerTests
//
//  Created by Gabriel Targon on 19/04/23.
//

@testable import TMDBViewer

final class HomeViewControllerSpy: MockViewController {
    var displayMoviesCalled = false
    var displayErrorCalled = false
}

extension HomeViewControllerSpy: HomeDisplayLogic {
    func displayMovies(viewModel: TMDBViewer.Home.Movies.ViewModel) {
        displayMoviesCalled = true
    }
    
    func displayError(description: String) {
        displayErrorCalled = true
    }
}

//
//  HomeInteractorSpy.swift
//  TMDBViewerTests
//
//  Created by Gabriel Targon on 19/04/23.
//

@testable import TMDBViewer

final class HomeInteractorSpy {
    var requestMoviesListCalled = false
}

extension HomeInteractorSpy: HomeBusinessLogic {
    func requestMoviesList(request: TMDBViewer.Home.Movies.Request) {
        requestMoviesListCalled = true
    }
}

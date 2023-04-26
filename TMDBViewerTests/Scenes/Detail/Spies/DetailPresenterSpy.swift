//
//  DetailPresenterSpy.swift
//  TMDBViewerTests
//
//  Created by Gabriel Targon on 26/04/23.
//

@testable import TMDBViewer

final class DetailPresenterSpy {
    var presentMovieCalled = false
    var presentErrorCalled = false
}

extension DetailPresenterSpy: DetailPresentationLogic {
    func presentMovie(response: TMDBViewer.Detail.Film.Response) {
        presentMovieCalled = true
    }
    
    func presentError(description: String) {
        presentErrorCalled = true
    }
}

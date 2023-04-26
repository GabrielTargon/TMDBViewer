//
//  DetailViewControllerSpy.swift
//  TMDBViewerTests
//
//  Created by Gabriel Targon on 26/04/23.
//

@testable import TMDBViewer

final class DetailViewControllerSpy: MockViewController {
    var displayMovieInfoCalled = false
    var displayErrorCalled = false
}

extension DetailViewControllerSpy: DetailDisplayLogic {
    func displayMovieInfo(viewModel: TMDBViewer.Detail.Film.ViewModel) {
        displayMovieInfoCalled = true
    }
    
    func displayError(description: String) {
        displayErrorCalled = true
    }
}

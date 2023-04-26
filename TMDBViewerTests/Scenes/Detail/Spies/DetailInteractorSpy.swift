//
//  DetailInteractorSpy.swift
//  TMDBViewerTests
//
//  Created by Gabriel Targon on 26/04/23.
//

@testable import TMDBViewer

final class DetailInteractorSpy: DetailDataStore {
    var id: Int = 1
    
    var requestMovieCalled = false
}

extension DetailInteractorSpy: DetailBusinessLogic {
    func requestMovie(request: TMDBViewer.Detail.Film.Request) {
        requestMovieCalled = true
    }
}

//
//  DetailRouterSpy.swift
//  TMDBViewerTests
//
//  Created by Gabriel Targon on 26/04/23.
//

@testable import TMDBViewer

final class DetailRouterSpy: DetailDataPassing {
    var dataStore: TMDBViewer.DetailDataStore? = DetailInteractorSpy()
    
    var routeToErrorCalled = false
}

extension DetailRouterSpy: DetailRoutingLogic {
    func routeToError(description: String) {
        routeToErrorCalled = true
    }
}

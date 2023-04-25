//
//  HomeRouterSpy.swift
//  TMDBViewerTests
//
//  Created by Gabriel Targon on 19/04/23.
//

@testable import TMDBViewer
import ObjectiveC

final class HomeRouterSpy {
    var routeToMovieDetailCalled = false
    var routeToErrorCalled = false
}

extension HomeRouterSpy: HomeRoutingLogic, HomeDataPassing {
    var dataStore: TMDBViewer.HomeDataStore? {
        nil
    }
    
    func routeToMovieDetail(id: Int) {
        routeToMovieDetailCalled = true
    }
    
    func routeToError(description: String) {
        routeToErrorCalled = true
    }
}

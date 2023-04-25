//
//  HomeWorkerSpy.swift
//  TMDBViewerTests
//
//  Created by Gabriel Targon on 23/04/23.
//

@testable import TMDBViewer

final class HomeWorkerSpy: MockWorker {
    var fetchMoviesCalled = false
}

extension HomeWorkerSpy: HomeWorkLogic {
    func fetchMovies(endpoint: Home.Endpoint,
                     params: [String: String]?,
                     result: @escaping (Result<MoviesResponse, NetworkError>) -> Void) {
        fetchMoviesCalled = true
        
        switch resultType {
        case .success:
            result(.success(HomeSeeds.moviesResponseStub))
        case .failure:
            result(.failure(NetworkError.unknown))
        }
    }
}

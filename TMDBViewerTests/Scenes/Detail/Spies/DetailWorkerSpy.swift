//
//  DetailWorkerSpy.swift
//  TMDBViewerTests
//
//  Created by Gabriel Targon on 26/04/23.
//

@testable import TMDBViewer

final class DetailWorkerSpy: MockWorker {
    var fetchMovieCalled = false
}

extension DetailWorkerSpy: DetailWorkLogic {
    func fetchMovie(id: Int, result: @escaping (Result<TMDBViewer.Movie, TMDBViewer.NetworkError>) -> Void) {
        fetchMovieCalled = true
        
        switch resultType {
        case .success:
            result(.success(DetailSeeds.detail))
        case .failure(errorType: .unknown):
            result(.failure(.unknown))
        default:
            result(.failure(.unknown))
        }
    }
}

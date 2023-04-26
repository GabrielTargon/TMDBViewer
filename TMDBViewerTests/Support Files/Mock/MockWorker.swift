//
//  MockWorker.swift
//  TMDBViewerTests
//
//  Created by Gabriel Targon on 24/04/23.
//

@testable import TMDBViewer

enum WorkerSpyResultType {
    case success
    case failure(errorType: NetworkError)
}

class MockWorker {
    var resultType = WorkerSpyResultType.success
}

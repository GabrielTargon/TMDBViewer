//
//  MockWorker.swift
//  TMDBViewerTests
//
//  Created by Gabriel Targon on 24/04/23.
//

enum WorkerSpyResultType {
    case success
    case failure
}

class MockWorker {
    var resultType = WorkerSpyResultType.success
}

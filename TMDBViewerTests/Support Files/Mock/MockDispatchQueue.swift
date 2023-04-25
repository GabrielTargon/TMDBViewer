//
//  MockDispatchQueue.swift
//  TMDBViewerTests
//
//  Created by Gabriel Targon on 24/04/23.
//

@testable import TMDBViewer

final class MockDispatchQueue: DispatchQueueType {
    func async(execute work: @escaping @convention(block) () -> Void) {
        work()
    }
}

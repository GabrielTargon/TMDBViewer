//
//  XCTestCase+Extension.swift
//  TMDBViewerTests
//
//  Created by Gabriel Targon on 24/04/23.
//

import XCTest

extension XCTestCase {
    
    public func requestSucceed<R, E: Error, T> (result: Result<R, E>,
                                                resultType: T.Type) -> Bool {
        switch result {
        case .success(let response):
            return response is T
        case .failure:
            return false
        }
    }
    
    public func waitExpectation(timeout: TimeInterval = 1.0) {
        waitForExpectations(timeout: timeout)
    }
}

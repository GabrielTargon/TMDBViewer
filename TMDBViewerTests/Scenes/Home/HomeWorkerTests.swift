//
//  HomeWorkerTests.swift
//  TMDBViewer
//
//  Created by Gabriel Targon on 25/03/23.

@testable import TMDBViewer
import XCTest

class HomeWorkerTests: XCTestCase {
    
    // MARK: Subject under test
    var sut: HomeWorker!
    
    // MARK: Doubles
    private var dataMock: MockData!
    
    // MARK: Test lifecycle
    override func setUp() {
        super.setUp()
        setupHomeWorker()
    }
    
    override func tearDown() {
        sut = nil
        dataMock = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    func setupHomeWorker() {
        sut = HomeWorker()
        dataMock = MockData()
    }
    
    // MARK: Tests
    func test_fetchMovies() {
        dataMock.expectedResult = .successJSON("MoviesResponse")
        let expectation = self.expectation(description: "Expect fetch list")
        
        sut.fetchMovies(endpoint: Home.Endpoint.nowPlaying,
                        params: nil) { (result) in
            XCTAssertTrue(self.requestSucceed(result: result,
                                              resultType: MoviesResponse.self))
            expectation.fulfill()
        }
        
        waitExpectation()
    }
}

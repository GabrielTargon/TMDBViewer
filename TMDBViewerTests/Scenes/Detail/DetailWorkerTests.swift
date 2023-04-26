//
//  DetailWorkerTests.swift
//  TMDBViewer
//
//  Created by Gabriel Targon on 26/04/23.
//

@testable import TMDBViewer
import XCTest

class DetailWorkerTests: XCTestCase {
    
    // MARK: Subject under test
    var sut: DetailWorker!
    
    // MARK: Doubles
    private var dataMock: MockData!
    
    // MARK: Test lifecycle
    override func setUp() {
        super.setUp()
        setupDetailWorker()
    }
    
    override func tearDown() {
        sut = nil
        dataMock = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupDetailWorker() {
        sut = DetailWorker()
        dataMock = MockData()
    }
    
    // MARK: Tests
    
    func test_fetchMovie() {
        dataMock.expectedResult = .successJSON("Movie")
        let expectation = self.expectation(description: "Expect fetch list")
        
        sut.fetchMovie(id: DetailSeeds.detail.id) { (result) in
            XCTAssertTrue(self.requestSucceed(result: result,
                                              resultType: Movie.self))
            expectation.fulfill()
        }
        
        waitExpectation()
    }
}

//
//  DetailInteractorTests.swift
//  TMDBViewer
//
//  Created by Gabriel Targon on 26/04/23.
//

@testable import TMDBViewer
import XCTest

class DetailInteractorTests: XCTestCase {
    
    // MARK: Subject under test
    var sut: DetailInteractor!
    
    // MARK: Doubles
    private var presenterSpy: DetailPresenterSpy!
    private var workerSpy: DetailWorkerSpy!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
        setupDetailInteractor()
    }
    
    override func tearDown() {
        sut = nil
        presenterSpy = nil
        workerSpy = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupDetailInteractor() {
        sut = DetailInteractor()
        presenterSpy = DetailPresenterSpy()
        workerSpy = DetailWorkerSpy()
        
        sut.presenter = presenterSpy
        sut.worker = workerSpy
    }
    
    // MARK: Tests
    
    func test_requestMovie_Success() {
        let seed = DetailSeeds.detailRequestStub
        
        sut.requestMovie(request: seed)
        
        XCTAssertTrue(workerSpy.fetchMovieCalled)
        XCTAssertTrue(presenterSpy.presentMovieCalled)
    }
    
    func test_requestMovie_Failure() {
        workerSpy.resultType = .failure(errorType: .unknown)
        let seed = DetailSeeds.detailRequestStub
        
        sut.requestMovie(request: seed)
        
        XCTAssertTrue(workerSpy.fetchMovieCalled)
        XCTAssertTrue(presenterSpy.presentErrorCalled)
    }
}

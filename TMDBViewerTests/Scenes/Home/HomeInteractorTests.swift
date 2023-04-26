//
//  HomeInteractorTests.swift
//  TMDBViewer
//
//  Created by Gabriel Targon on 25/03/23.

@testable import TMDBViewer
import XCTest

class HomeInteractorTests: XCTestCase {
    
    // MARK: Subject under test
    var sut: HomeInteractor!
    
    // MARK: Doubles
    private var presenterSpy: HomePresenterSpy!
    private var workerSpy: HomeWorkerSpy!
    
    // MARK: Test lifecycle
    override func setUp() {
        super.setUp()
        setupHomeInteractor()
    }
    
    override func tearDown() {
        sut = nil
        presenterSpy = nil
        workerSpy = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    func setupHomeInteractor() {
        sut = HomeInteractor()
        presenterSpy = HomePresenterSpy()
        workerSpy = HomeWorkerSpy()
        
        sut.presenter = presenterSpy
        sut.worker = workerSpy
    }
    
    // MARK: Tests
    func test_requestMoviesList_Success() {
        let seed = HomeSeeds.endpointStub
        let request = Home.Movies.Request(endpoint: seed)
        
        sut.requestMoviesList(request: request)
        
        XCTAssertTrue(workerSpy.fetchMoviesCalled)
        XCTAssertTrue(presenterSpy.presentMoviesCalled)
    }
    
    func test_requestMoviesList_Failure() {
        workerSpy.resultType = .failure(errorType: .unknown)
        let seed = HomeSeeds.endpointStub
        let request = Home.Movies.Request(endpoint: seed)
        
        sut.requestMoviesList(request: request)
        
        XCTAssertTrue(workerSpy.fetchMoviesCalled)
        XCTAssertTrue(presenterSpy.presentErrorCalled)
    }
}

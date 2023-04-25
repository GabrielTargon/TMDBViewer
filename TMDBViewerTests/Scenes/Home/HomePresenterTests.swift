//
//  HomePresenterTests.swift
//  TMDBViewer
//
//  Created by Gabriel Targon on 25/03/23.

@testable import TMDBViewer
import XCTest

class HomePresenterTests: XCTestCase {
    // MARK: Subject under test
    var sut: HomePresenter!
    
    // MARK: Doubles
    private var viewControllerSpy: HomeViewControllerSpy!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
        setupHomePresenter()
    }
    
    override func tearDown() {
        sut = nil
        viewControllerSpy = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupHomePresenter() {
        sut = HomePresenter()
        viewControllerSpy = HomeViewControllerSpy()
        
        sut.viewController = viewControllerSpy
    }
    
    // MARK: Test doubles
    
    func testPresentMovies() {
        let seed = HomeSeeds.moviesResponseStub
        let response = Home.Movies.Response(movies: seed)
        
        sut.presentMovies(response: response)
        
        XCTAssertTrue(viewControllerSpy.displayMoviesCalled)
    }
    
    func testPresentError() {
        sut.presentError(description: "Test")
        
        XCTAssertTrue(viewControllerSpy.displayErrorCalled)
    }
}

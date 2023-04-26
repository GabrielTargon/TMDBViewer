//
//  DetailPresenterTests.swift
//  TMDBViewer
//
//  Created by Gabriel Targon on 26/04/23.
//

@testable import TMDBViewer
import XCTest

class DetailPresenterTests: XCTestCase {
    
    // MARK: Subject under test
    var sut: DetailPresenter!
    
    // MARK: Doubles
    private var viewControllerSpy: DetailViewControllerSpy!
    
    // MARK: Test lifecycle
    override func setUp() {
        super.setUp()
        setupDetailPresenter()
    }
    
    override func tearDown() {
        sut = nil
        viewControllerSpy = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupDetailPresenter() {
        sut = DetailPresenter()
        viewControllerSpy = DetailViewControllerSpy()
        
        sut.viewController = viewControllerSpy
    }
    
    // MARK: Tests
    
    func test_presentMovie() {
        let seed = DetailSeeds.detail
        let response = Detail.Film.Response(movie: seed)
        
        sut.presentMovie(response: response)
        
        XCTAssertTrue(viewControllerSpy.displayMovieInfoCalled)
    }
    
    func test_presentError() {
        sut.presentError(description: "test")
        
        XCTAssertTrue(viewControllerSpy.displayErrorCalled)
    }
}

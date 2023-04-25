//
//  HomeRouterTests.swift
//  TMDBViewerTests
//
//  Created by Gabriel Targon on 23/04/23.
//

@testable import TMDBViewer
import XCTest

class HomeRouterTests: XCTestCase {
    // MARK: Subject under test
    var sut: HomeRouter!
    
    // MARK: Doubles
    private var viewControllerSpy: HomeViewControllerSpy!
    private var mockNavigationViewController: MockNavigationController!
    
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
        setupHomeRouter()
    }
    
    override func tearDown() {
        sut = nil
        viewControllerSpy = nil
        mockNavigationViewController = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupHomeRouter() {
        sut = HomeRouter()
        viewControllerSpy = HomeViewControllerSpy()
        mockNavigationViewController = MockNavigationController(rootViewController: viewControllerSpy)
        
        sut.viewController = viewControllerSpy
    }
    
    // MARK: Test doubles
    
    func testRouteToMovieDetail() {
        sut.routeToMovieDetail(id: 1)
        
        XCTAssertTrue(mockNavigationViewController.pushedVC is DetailViewController)
    }
    
    func testRouteToError() {
        sut.mainDispatchQueue = MockDispatchQueue()
        
        sut.routeToError(description: "Error Test")

        XCTAssertTrue(mockNavigationViewController.presentedVC is UIAlertController)
    }
}

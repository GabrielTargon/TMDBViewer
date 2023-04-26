//
//  DetailRouterTests.swift
//  TMDBViewerTests
//
//  Created by Gabriel Targon on 26/04/23.
//

@testable import TMDBViewer
import XCTest

class DetailRouterTests: XCTestCase {
    
    // MARK: Subject under test
    var sut: DetailRouter!
    
    // MARK: Doubles
    private var viewControllerSpy: DetailViewControllerSpy!
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
        sut = DetailRouter()
        viewControllerSpy = DetailViewControllerSpy()
        mockNavigationViewController = MockNavigationController(rootViewController: viewControllerSpy)
        
        sut.viewController = viewControllerSpy
    }
    
    // MARK: Tests
    
    func test_routeToError() {
        sut.mainDispatchQueue = MockDispatchQueue()
        
        sut.routeToError(description: "test")
        
        XCTAssertTrue(mockNavigationViewController.presentedVC is UIAlertController)
    }
}

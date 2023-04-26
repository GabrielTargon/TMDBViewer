//
//  LoginRouterTests.swift
//  TMDBViewerTests
//
//  Created by Gabriel Targon on 24/04/23.
//

@testable import TMDBViewer
import XCTest

class LoginRouterTests: XCTestCase {
    
    // MARK: Subject under test
    var sut: LoginRouter!
    
    // MARK: Doubles
    private var viewControllerSpy: LoginViewControllerSpy!
    private var mockNavigationViewController: MockNavigationController!
    
    // MARK: Test lifecycle
    override func setUp() {
        super.setUp()
        setupLoginRouter()
    }
    
    override func tearDown() {
        sut = nil
        viewControllerSpy = nil
        mockNavigationViewController = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupLoginRouter() {
        sut = LoginRouter()
        viewControllerSpy = LoginViewControllerSpy()
        mockNavigationViewController = MockNavigationController(rootViewController: viewControllerSpy)
        
        sut.viewController = viewControllerSpy
    }
    
    // MARK: Tests
    
    func test_routeToHome() {
        sut.routeToHome()
        
        XCTAssertTrue(mockNavigationViewController.pushedVC is HomeViewController)
    }
    
    func test_routeToError() {
        sut.mainDispatchQueue = MockDispatchQueue()
        
        sut.routeToError(description: "test")
        
        XCTAssertTrue(mockNavigationViewController.presentedVC is UIAlertController)
    }
}

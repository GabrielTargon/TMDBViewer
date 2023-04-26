//
//  LoginPresenterTests.swift
//  TMDBViewerTests
//
//  Created by Gabriel Targon on 24/04/23.
//

@testable import TMDBViewer
import XCTest

class LoginPresenterTests: XCTestCase {
    
    // MARK: Subject under test
    var sut: LoginPresenter!
    
    // MARK: Doubles
    private var viewControllerSpy: LoginViewControllerSpy!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
        setupLoginPresenter()
    }
    
    override func tearDown() {
        sut = nil
        viewControllerSpy = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupLoginPresenter() {
        sut = LoginPresenter()
        viewControllerSpy = LoginViewControllerSpy()
        
        sut.viewController = viewControllerSpy
    }
    
    // MARK: Tests
    
    func test_presentHome() {
        sut.presentHome()
        
        XCTAssertTrue(viewControllerSpy.displayHomeCalled)
    }
    
    func test_presentError() {
        sut.presentError(description: "test")
        
        XCTAssertTrue(viewControllerSpy.displayErrorCalled)
    }
}

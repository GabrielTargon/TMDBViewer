//
//  LoginViewControllerTests.swift
//  TMDBViewerTests
//
//  Created by Gabriel Targon on 24/04/23.
//

@testable import TMDBViewer
import XCTest

class LoginViewControllerTests: XCTestCase {
    
    // MARK: Subject under test
    var sut: LoginViewController!
    
    // MARK: Doubles
    private var interactorSpy: LoginInteractorSpy!
    private var routerSpy: LoginRouterSpy!
    
    // MARK: Test lifecycle
    override func setUp() {
        super.setUp()
        setupLoginViewController()
    }
    
    override func tearDown() {
        sut = nil
        interactorSpy = nil
        routerSpy = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupLoginViewController() {
        sut = LoginViewController()
        interactorSpy = LoginInteractorSpy()
        routerSpy = LoginRouterSpy()
        
        sut.interactor = interactorSpy
        sut.router = routerSpy
    }
    
    // MARK: Tests
    
    func test_viewDidLoad() {
        sut.viewDidLoad()
        
        XCTAssertTrue(sut.view is LoginView)
    }
    
    func test_didSelectLogin() {
        let seed = LoginSeeds.requestLoginStub
        
        sut.didSelectLogin(user: seed)
        
        XCTAssertTrue(interactorSpy.requestLoginCalled)
    }
    
    func test_didSelectFastLogin() {
        sut.didSelectFastLogin()
        
        XCTAssertTrue(interactorSpy.requestFastLoginCalled)
    }
    
    func test_displayHome() {
        sut.displayHome()
        
        XCTAssertTrue(routerSpy.routeToHomeCalled)
    }
    
    func test_displayError() {
        sut.displayError(description: "test")
        
        XCTAssertTrue(routerSpy.routeToErrorCalled)
    }
}

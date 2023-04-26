//
//  LoginInteractorTests.swift
//  TMDBViewerTests
//
//  Created by Gabriel Targon on 24/04/23.
//

@testable import TMDBViewer
import XCTest

class LoginInteractorTests: XCTestCase {
    
    // MARK: Subject under test
    var sut: LoginInteractor!
    
    // MARK: Doubles
    private var presenterSpy: LoginPresenterSpy!
    private var workerSpy: LoginWorkerSpy!
    
    // MARK: Test lifecycle
    override func setUp() {
        super.setUp()
        setupLoginInteractor()
    }
    
    override func tearDown() {
        sut = nil
        presenterSpy = nil
        workerSpy = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupLoginInteractor() {
        sut = LoginInteractor()
        presenterSpy = LoginPresenterSpy()
        workerSpy = LoginWorkerSpy()
        
        sut.presenter = presenterSpy
        sut.worker = workerSpy
    }
    
    // MARK: Tests
    
    func test_requestLogin_Success() {
        let seed = LoginSeeds.requestLoginStub
        
        sut.requestLogin(with: seed)
        
        XCTAssertTrue(workerSpy.getRequestTokenCalled)
    }
    
    func test_requestLogin_Failure() {
        workerSpy.resultType = .failure(errorType: .invalidResponse)
        
        let seed = LoginSeeds.requestLoginStub
        sut.requestLogin(with: seed)
        
        XCTAssertTrue(workerSpy.getRequestTokenCalled)
        XCTAssertTrue(presenterSpy.presentErrorCalled)
    }
    
    func test_validateLogin_Success() {
        let seed = LoginSeeds.validateLoginStub
        
        sut.validateLogin(with: seed)
        
        XCTAssertTrue(workerSpy.fetchLoginCalled)
        XCTAssertTrue(presenterSpy.presentHomeCalled)
    }
    
    func test_validateLogin_Failure() {
        workerSpy.resultType = .failure(errorType: .invalidResponse)
        let seed = LoginSeeds.validateLoginStub
        
        sut.validateLogin(with: seed)
        
        XCTAssertTrue(workerSpy.fetchLoginCalled)
        XCTAssertTrue(presenterSpy.presentErrorCalled)
    }
    
    func test_requestFastLogin() {
        sut.requestFastLogin()
        
        XCTAssertTrue(presenterSpy.presentHomeCalled)
    }
}

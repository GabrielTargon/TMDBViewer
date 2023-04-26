//
//  LoginWorkerTests.swift
//  TMDBViewerTests
//
//  Created by Gabriel Targon on 24/04/23.
//

@testable import TMDBViewer
import XCTest

class LoginWorkerTests: XCTestCase {
    
    // MARK: Subject under test
    var sut: LoginWorker!
    
    // MARK: Doubles
    private var dataMock: MockData!
    
    // MARK: Test lifecycle
    override func setUp() {
        super.setUp()
        setupLoginWorker()
    }
    
    override func tearDown() {
        sut = nil
        dataMock = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupLoginWorker() {
        sut = LoginWorker()
        dataMock = MockData()
    }
    
    // MARK: Tests
    
    func test_getRequestToken() {
        dataMock.expectedResult = .successJSON("RequestToken")
        let expectation = self.expectation(description: "Expect fetch list")
        
        sut.getRequestToken { (result) in
            XCTAssertTrue(self.requestSucceed(result: result,
                                              resultType: Login.TokenRequest.self))
            expectation.fulfill()
        }
        
        waitExpectation()
    }
    
    func test_fetchLogin() {
        dataMock.expectedResult = .successJSON("Login")
        let expectation = self.expectation(description: "Expect fetch list")
        let seed = LoginSeeds.validateLoginStub
        
        sut.fetchLogin(with: seed) { (result) in
            XCTAssertTrue(self.requestSucceed(result: result,
                                              resultType: Login.SessionResponse.self))
            expectation.fulfill()
        }
        
        waitExpectation()
    }
}

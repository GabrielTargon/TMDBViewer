//
//  LoginPresenterSpy.swift
//  TMDBViewerTests
//
//  Created by Gabriel Targon on 24/04/23.
//

@testable import TMDBViewer

final class LoginPresenterSpy {
    var presentHomeCalled = false
    var presentErrorCalled = false
}

extension LoginPresenterSpy: LoginPresentationLogic {
    func presentHome() {
        presentHomeCalled = true
    }
    
    func presentError(description: String) {
        presentErrorCalled = true
    }
}

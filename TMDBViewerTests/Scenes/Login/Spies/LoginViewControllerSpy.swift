//
//  LoginViewControllerSpy.swift
//  TMDBViewerTests
//
//  Created by Gabriel Targon on 24/04/23.
//

@testable import TMDBViewer

final class LoginViewControllerSpy: MockViewController {
    var didSelectLoginCalled = false
    var didSelectFastLoginCalled = false
    var displayHomeCalled = false
    var displayErrorCalled = false
}

extension LoginViewControllerSpy: LoginDisplayLogic {
    func didSelectLogin(user: TMDBViewer.Login.User.Request) {
        didSelectLoginCalled = true
    }
    
    func didSelectFastLogin() {
        didSelectFastLoginCalled = true
    }
    
    func displayHome() {
        displayHomeCalled = true
    }
    
    func displayError(description: String) {
        displayErrorCalled = true
    }
}


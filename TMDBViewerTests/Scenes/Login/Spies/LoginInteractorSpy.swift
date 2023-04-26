//
//  LoginInteractorSpy.swift
//  TMDBViewerTests
//
//  Created by Gabriel Targon on 24/04/23.
//

@testable import TMDBViewer

final class LoginInteractorSpy {
    var requestLoginCalled = false
    var validateLoginCalled = false
    var requestFastLoginCalled = false
}

extension LoginInteractorSpy: LoginBusinessLogic {
    func requestLogin(with credentials: TMDBViewer.Login.User.Request) {
        requestLoginCalled = true
    }
    
    func validateLogin(with credentials: TMDBViewer.Login.User.Response) {
        validateLoginCalled = true
    }
    
    func requestFastLogin() {
        requestFastLoginCalled = true
    }
}

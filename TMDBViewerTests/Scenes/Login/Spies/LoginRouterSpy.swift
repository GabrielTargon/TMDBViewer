//
//  LoginRouterSpy.swift
//  TMDBViewerTests
//
//  Created by Gabriel Targon on 24/04/23.
//

@testable import TMDBViewer

final class LoginRouterSpy {
    var routeToHomeCalled = false
    var routeToErrorCalled = false
}

extension LoginRouterSpy: LoginRoutingLogic, LoginDataPassing {
    var dataStore: TMDBViewer.LoginDataStore? {
        nil
    }
    
    func routeToHome() {
        routeToHomeCalled = true
    }
    
    func routeToError(description: String) {
        routeToErrorCalled = true
    }
}

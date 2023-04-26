//
//  LoginWorkerSpy.swift
//  TMDBViewerTests
//
//  Created by Gabriel Targon on 24/04/23.
//

@testable import TMDBViewer

final class LoginWorkerSpy: MockWorker {
    var fetchLoginCalled = false
    var getRequestTokenCalled = false
}

extension LoginWorkerSpy: LoginWorkLogic {
    
    func getRequestToken(result: @escaping (Result<TMDBViewer.Login.TokenRequest, Error>) -> Void) {
        getRequestTokenCalled = true
        
        switch resultType {
        case .success:
            result(.success(LoginSeeds.requestTokenStub))
        case .failure:
            result(.failure(NetworkError.unknown))
        }
    }
    
    func fetchLogin(with credentials: TMDBViewer.Login.User.Response,
                    result: @escaping (Result<TMDBViewer.Login.SessionResponse, TMDBViewer.NetworkError>) -> Void) {
        fetchLoginCalled = true
        
        switch resultType {
        case .success:
            result(.success(LoginSeeds.sessionResponseStub))
        case .failure:
            result(.failure(NetworkError.unknown))
        }
    }
}

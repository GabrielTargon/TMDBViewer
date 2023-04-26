//
//  LoginWorker.swift
//  TMDBViewer
//
//  Created by Gabriel Targon on 22/10/22.
//

import Foundation

protocol LoginWorkLogic {
    func getRequestToken(result: @escaping (Result<Login.TokenRequest, Error>) -> Void)
    func fetchLogin(with credentials: Login.User.Response,
                    result: @escaping (Result<Login.SessionResponse, NetworkError>) -> Void)
}

class LoginWorker: LoginWorkLogic {
    
    func getRequestToken(result: @escaping (Result<Login.TokenRequest, Error>) -> Void) {
        let endpoint = TMDBEndpoint(path: "authentication/token/new",
                                    method: .get)
        
        NetworkService.makeRequest(endpoint) { (response: Result<Login.TokenRequest, NetworkError>) in
            switch response {
            case .success(let data):
                result(.success(data))
            case.failure(let error):
                result(.failure(error))
            }
        }
    }
    
    func fetchLogin(with credentials: Login.User.Response,
                    result: @escaping (Result<Login.SessionResponse, NetworkError>) -> Void) {
        var endpoint = TMDBEndpoint(path: "authentication/token/validate_with_login",
                                    method: .post)
        endpoint.parameters = ["username" : credentials.username,
                               "password" : credentials.password,
                               "request_token" : credentials.requestToken]
        
        NetworkService.makeRequest(endpoint) { (response: Result<Login.SessionResponse, NetworkError>) in
            switch response {
            case .success(let data):
                result(.success(data))
            case.failure(let error):
                result(.failure(error))
            }
        }
    }
}

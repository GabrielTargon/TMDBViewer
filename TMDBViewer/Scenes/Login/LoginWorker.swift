//
//  LoginWorker.swift
//  TMDBViewer
//
//  Created by Gabriel Targon on 22/10/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import Foundation

class LoginWorker: NetworkConsumer {
    
    func fetchLogin(with credentials: Login.User.Request,
                    result: @escaping (Result<Bool, MovieError>) -> Void) {
        let session = Login.SessionRequest(username: credentials.username,
                                           password: credentials.password)
        
        getRequestToken { response in
            var urlComponente = URLComponents(string: "\(self.baseAPIURL)/authentication/token/validate_with_login")
            
            let queryItems = [URLQueryItem(name: "api_key", value: self.apiKey),
                              URLQueryItem(name: "username", value: session.username),
                              URLQueryItem(name: "password", value: session.password),
                              URLQueryItem(name: "request_token", value: response.requestToken)]
            
            urlComponente?.queryItems = queryItems
            
            guard let url = urlComponente?.url else {
                result(.failure(MovieError.invalidEndpoint))
                return
            }
            
            self.urlSession.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    result(.failure(MovieError.apiError))
                    return
                }
                
                guard let data = data else {
                    result(.failure(MovieError.noData))
                    return
                }
                
                do {
                    let sessionResponse = try self.jsonDecoder.decode(Login.SessionResponse.self,
                                                                      from: data)
                    DispatchQueue.main.async {
                        result(.success(sessionResponse.success))
                    }
                } catch {
                    result(.failure(MovieError.serializationError))
                }
            }.resume()
        } errorHandler: { error in
            result(.failure(MovieError.invalidResponse))
        }
        
    }
    
    func getRequestToken(successHandler: @escaping (_ response: Login.TokenRequest) -> Void,
                         errorHandler: @escaping(_ error: Error) -> Void) {
        let urlComponentes = URLComponents(string: "\(baseAPIURL)/authentication/token/new?api_key=\(apiKey)")
        
        guard let url = urlComponentes?.url else {
            errorHandler(MovieError.invalidEndpoint)
            return
        }
        
        urlSession.dataTask(with: url) { (data, response, error) in
            if error != nil {
                errorHandler(MovieError.apiError)
                return
            }
            
            guard let data = data else {
                errorHandler(MovieError.noData)
                return
            }
            
            do {
                let tokenResponse = try self.jsonDecoder.decode(Login.TokenRequest.self,
                                                                from: data)
                DispatchQueue.main.async {
                    successHandler(tokenResponse)
                }
            } catch {
                errorHandler(MovieError.serializationError)
            }
        }.resume()
    }
}

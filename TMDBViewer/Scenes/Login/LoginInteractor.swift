//
//  LoginInteractor.swift
//  TMDBViewer
//
//  Created by Gabriel Targon on 22/10/22.
//

import UIKit

protocol LoginBusinessLogic {
    func requestLogin(with credentials: Login.User.Request)
    func validateLogin(with credentials: Login.User.Response)
    func requestFastLogin()
}

protocol LoginDataStore {}

class LoginInteractor: LoginBusinessLogic, LoginDataStore {
    var presenter: LoginPresentationLogic?
    var worker: LoginWorkLogic?
    
    // MARK: Functions
    
    func requestLogin(with credentials: Login.User.Request) {
        worker?.getRequestToken(result: { result in
            switch result {
            case .success(let data):
                let credentials = Login.User.Response(username: credentials.username,
                                                      password: credentials.password,
                                                      requestToken: data.requestToken)
                self.validateLogin(with: credentials)
            case .failure(let error):
                self.presenter?.presentError(description: error.localizedDescription)
            }
        })
    }
    
    func validateLogin(with credentials: Login.User.Response) {
        worker?.fetchLogin(with: credentials,
                           result: { result in
            switch result {
            case .success:
                self.presenter?.presentHome()
            case .failure(let error):
                if error == .invalidResponse {
                    self.presenter?.presentError(description: "Invalid APIKey. Please add APIkey on MovieStore.swift")
                } else {
                    self.presenter?.presentError(description: error.localizedDescription)
                }
            }
        })
    }
    
    func requestFastLogin() {
        self.presenter?.presentHome()
    }
}

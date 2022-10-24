//
//  LoginInteractor.swift
//  TMDBViewer
//
//  Created by Gabriel Targon on 22/10/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol LoginBusinessLogic {
    func requestLogin(with credentials: Login.User.Request)
}

protocol LoginDataStore {}

class LoginInteractor: LoginBusinessLogic, LoginDataStore {
    var presenter: LoginPresentationLogic?
    var worker: LoginWorker? = LoginWorker()
    
    // MARK: Functions
    
    func requestLogin(with credentials: Login.User.Request) {
        
        worker?.fetchLogin(with: credentials,
                           result: { result in
            switch result {
            case .success:
                self.presenter?.presentHome()
            case .failure(let error):
                if error == .invalidResponse {
                    self.presenter?.presentError(description: "Invalid APIKey. Please add APIkey on NetworkConsumer.swift")
                } else {
                    self.presenter?.presentError(description: error.localizedDescription)
                }
            }
        })
    }
}

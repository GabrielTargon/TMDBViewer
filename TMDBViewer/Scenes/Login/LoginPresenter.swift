//
//  LoginPresenter.swift
//  TMDBViewer
//
//  Created by Gabriel Targon on 22/10/22.
//

import UIKit

protocol LoginPresentationLogic {
    func presentHome()
    func presentError(description: String)
}

class LoginPresenter: LoginPresentationLogic {
    weak var viewController: LoginDisplayLogic?
    
    func presentHome() {
        viewController?.displayHome()
    }
    
    func presentError(description: String) {
        viewController?.displayError(description: description)
    }
}

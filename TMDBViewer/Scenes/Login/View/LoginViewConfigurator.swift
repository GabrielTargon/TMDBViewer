//
//  LoginSceneConfigurator.swift
//  TMDBViewer
//

protocol LoginViewModel {
    var delegate: LoginDisplayLogic? { get set }
    var username: String { get set }
    var password: String { get set }
}

class LoginViewConfigurator: LoginViewModel {
    var delegate: LoginDisplayLogic?
    var username: String
    var password: String
    
    init(delegate: LoginDisplayLogic? = nil, username: String, password: String) {
        self.delegate = delegate
        self.username = username
        self.password = password
    }
}

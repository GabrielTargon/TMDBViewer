//
//  LoginSceneViewController.swift
//  TMDBViewer
//

import UIKit
import SwiftUI

protocol LoginDisplayLogic: AnyObject {
    func didSelectLogin(user: Login.User.Request)
    func didSelectFastLogin()
    func displayHome()
    func displayError(description: String)
}

class LoginViewController: UIViewController, LoginDisplayLogic {

    var interactor: LoginBusinessLogic?
    var router: (NSObjectProtocol & LoginRoutingLogic & LoginDataPassing)?
    
    let loginView = LoginView()
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        let router = LoginRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = loginView
        loginView.viewController = self
    }
    
    // MARK: Public functions
    
    func didSelectLogin(user: Login.User.Request) {
        interactor?.requestLogin(with: user)
    }
    
    func didSelectFastLogin() {
        interactor?.requestFastLogin()
    }
    
    func displayHome() {
        router?.routeToHome()
    }
    
    func displayError(description: String) {
        router?.routeToError(description: description)
    }
}


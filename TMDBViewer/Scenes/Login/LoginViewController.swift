//
//  LoginSceneViewController.swift
//  TMDBViewer
//

import UIKit
import SwiftUI

protocol LoginDisplayLogic: AnyObject {
    func didSelectLogin(_ sender: LoginViewModel?)
    func displayHome()
    func displayError(description: String)
}

class LoginViewController: UIHostingController<LoginView>, LoginDisplayLogic {

    var interactor: LoginBusinessLogic?
    var router: (NSObjectProtocol & LoginRoutingLogic & LoginDataPassing)?
    var viewModel: LoginViewModel?
    
    // MARK: Object lifecycle
    
    override init(rootView: LoginView) {
        super.init(rootView: rootView)
        setup(with: rootView.viewModel)
    }
    
    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Setup
    
    private func setup(with viewModel: LoginViewModel) {
        let viewController = self
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        let router = LoginRouter()
        var viewModel = viewModel
        viewController.interactor = interactor
        viewController.router = router
        viewController.viewModel = viewModel
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        viewModel.delegate = viewController
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Public functions
    
    func didSelectLogin(_ sender: LoginViewModel?) {
        guard let sender = sender else {
            return
        }
        interactor?.requestLogin(with: Login.User.Request(username: sender.username,
                                                          password: sender.password))
    }
    
    func displayHome() {
        router?.routeToHome()
    }
    
    func displayError(description: String) {
        router?.routeToError(description: description)
    }
}


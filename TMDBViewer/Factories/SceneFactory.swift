//
//  SceneFactory.swift
//  TMDBViewer
//
//  Created by Gabriel Targon on 22/10/22.
//

import UIKit

protocol SceneFactory: AnyObject {
    func makeLoginScene() -> UIViewController
}

class DefaultSceneFactory: SceneFactory {
    func makeLoginScene() -> UIViewController {
        let model = LoginViewConfigurator(username: String(),
                                          password: String())
        let view = LoginView(viewModel: model)
        return LoginViewController(rootView: view)
    }
}



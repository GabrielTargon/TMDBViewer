//
//  LoginRouter.swift
//  TMDBViewer
//
//  Created by Gabriel Targon on 22/10/22.
//

import UIKit

@objc protocol LoginRoutingLogic {
    func routeToHome()
    func routeToError(description: String)
}

protocol LoginDataPassing {
    var dataStore: LoginDataStore? { get }
}

class LoginRouter: NSObject, LoginRoutingLogic, LoginDataPassing {
    weak var viewController: UIViewController?
    var dataStore: LoginDataStore?
    var mainDispatchQueue: DispatchQueueType
    
    init(viewController: UIViewController? = nil,
         dataStore: LoginDataStore? = nil,
         mainDispatchQueue: DispatchQueueType = DispatchQueue.main) {
        self.viewController = viewController
        self.dataStore = dataStore
        self.mainDispatchQueue = mainDispatchQueue
    }
    
    // MARK: Routing
    
    func routeToHome() {
        let nextViewController = HomeViewController()
        viewController?.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    func routeToError(description: String) {
        mainDispatchQueue.async {
            let alert = UIAlertController(title: "Something went wrong",
                                          message: description,
                                          preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Close",
                                          style: .default,
                                          handler: nil))
            
            self.viewController?.present(alert, animated: true, completion: nil)
        }
    }
}

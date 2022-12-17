//
//  HomeRouter.swift
//  TMDBViewer
//
//  Created by Gabriel Targon on 19/10/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol HomeRoutingLogic {
    func routeToMovieDetail(id: Int)
    func routeToError(description: String)
}

protocol HomeDataPassing {
    var dataStore: HomeDataStore? { get }
}

class HomeRouter: NSObject, HomeRoutingLogic, HomeDataPassing {
    weak var viewController: HomeViewController?
    var dataStore: HomeDataStore?
    
    // MARK: Routing
    
    func routeToMovieDetail(id: Int) {
        let nextViewController = DetailViewController()
        var destinationDataStore = nextViewController.router?.dataStore
        destinationDataStore?.id = id
        viewController?.navigationController?.pushViewController(nextViewController,
                                                                 animated: true)
    }
    
    func routeToError(description: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: HomeStrings.errorTitle.localized,
                                          message: description,
                                          preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: HomeStrings.errorButton.localized,
                                          style: .default,
                                          handler: nil))
            
            self.viewController?.present(alert, animated: true, completion: nil)
        }
    }
}

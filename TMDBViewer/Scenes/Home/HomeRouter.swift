//
//  HomeRouter.swift
//  TMDBViewer
//
//  Created by Gabriel Targon on 19/10/22.
//

import UIKit

@objc protocol HomeRoutingLogic {
    func routeToMovieDetail(id: Int)
    func routeToError(description: String)
}

protocol HomeDataPassing {
    var dataStore: HomeDataStore? { get }
}

class HomeRouter: HomeRoutingLogic, HomeDataPassing {
    weak var viewController: UIViewController?
    var dataStore: HomeDataStore?
    var mainDispatchQueue: DispatchQueueType
    
    init(viewController: UIViewController? = nil,
         dataStore: HomeDataStore? = nil,
         mainDispatchQueue: DispatchQueueType = DispatchQueue.main) {
        self.viewController = viewController
        self.dataStore = dataStore
        self.mainDispatchQueue = mainDispatchQueue
    }
    
    // MARK: Routing
    
    func routeToMovieDetail(id: Int) {
        let nextViewController = DetailViewController()
        var destinationDataStore = nextViewController.router?.dataStore
        destinationDataStore?.id = id
        viewController?.navigationController?.pushViewController(nextViewController,
                                                                 animated: true)
    }
    
    func routeToError(description: String) {
        mainDispatchQueue.async {
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

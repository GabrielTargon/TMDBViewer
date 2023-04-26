//
//  DetailRouter.swift
//  TMDBViewer
//
//  Created by Gabriel Targon on 20/10/22.
//

import UIKit

@objc protocol DetailRoutingLogic {
    func routeToError(description: String)
}

protocol DetailDataPassing {
    var dataStore: DetailDataStore? { get }
}

class DetailRouter: DetailRoutingLogic, DetailDataPassing {
    weak var viewController: UIViewController?
    var dataStore: DetailDataStore?
    var mainDispatchQueue: DispatchQueueType
    
    init(viewController: UIViewController? = nil, dataStore: DetailDataStore? = nil, mainDispatchQueue: DispatchQueueType = DispatchQueue.main) {
        self.viewController = viewController
        self.dataStore = dataStore
        self.mainDispatchQueue = mainDispatchQueue
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

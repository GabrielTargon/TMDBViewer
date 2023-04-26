//
//  MockViewController.swift
//  TMDBViewerTests
//
//  Created by Gabriel Targon on 24/04/23.
//

import UIKit

class MockViewController: UIViewController {
    // MARK: Doubles
    var dismissCalled = false
    
    // MARK: Functions
    override func present(_ viewControllerToPresent: UIViewController,
                          animated flag: Bool,
                          completion: (() -> Void)? = nil) {
        if let mockNavigationController = self.navigationController as? MockNavigationController {
            mockNavigationController.presentedVC = viewControllerToPresent
        }
        
        super.present(viewControllerToPresent, animated: flag, completion: completion)
    }
    
    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        dismissCalled = true
        
        if let mockNavigationController = self.navigationController as? MockNavigationController {
            mockNavigationController.dismissCalled = true
        }
        
        super.dismiss(animated: flag, completion: completion)
    }
}

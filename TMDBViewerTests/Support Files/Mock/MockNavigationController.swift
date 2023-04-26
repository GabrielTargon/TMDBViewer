//
//  MockNavigationController.swift
//  TMDBViewerTests
//
//  Created by Gabriel Targon on 24/04/23.
//

import XCTest
import UIKit

class MockNavigationController: UINavigationController {
    
    // MARK: Doubles
    var pushedVC: UIViewController?
    var popedVC: UIViewController?
    var presentedVC: UIViewController?
    
    var popToViewControllerCalled = false
    var popViewControllerCalled = false
    var popToRootViewControllerCalled = false
    var dismissCalled = false
    var setViewControllerCalled = false
    var setableViewControllers: [UIViewController] = []
    
    var currentNavigationColor: UIColor? {
        if #available(iOS 15.0, *) {
            return self.navigationBar.standardAppearance.backgroundColor
        } else {
            return navigationBar.barTintColor
        }
    }
    
    // MARK: Functions override
    override func pushViewController(_ viewController: UIViewController,
                                     animated: Bool) {
        pushedVC = viewController
        super.pushViewController(viewController, animated: animated)
    }
    
    override func present(_ viewControllerToPresent: UIViewController,
                          animated flag: Bool,
                          completion: (() -> Void)? = nil) {
        presentedVC = viewControllerToPresent
        super.present(viewControllerToPresent, animated: flag, completion: completion)
    }
    
    override func popViewController(animated: Bool) -> UIViewController? {
        popViewControllerCalled = true
        return nil
    }
    
    override func popToViewController(_ viewController: UIViewController,
                                      animated: Bool) -> [UIViewController]? {
        popedVC = viewController
        popViewControllerCalled = true
        return nil
    }
    
    override func popToRootViewController(animated: Bool) -> [UIViewController]? {
        popToRootViewControllerCalled = true
        return nil
    }
    
    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        self.dismissCalled = true
        super.dismiss(animated: flag, completion: completion)
    }
    
    override func setViewControllers(_ viewControllers: [UIViewController], animated: Bool) {
        self.setViewControllerCalled = true
        self.setableViewControllers = viewControllers
        super.setViewControllers(viewControllers, animated: animated)
    }
    
    // MARK: Functions
    func verifySetableViewControllersStack<T>(index: Int,
                                              type: T.Type,
                                              file: StaticString = #file,
                                              line: UInt = #line) {
        if index >= setableViewControllers.count {
            XCTFail("Invalid index", file: file, line: line)
            return
        }
        
        XCTAssertTrue(setableViewControllers[index] is T, "Current ViewController type at index is not equal to comparable type", file: file, line: line)
    }
    
    func getSetableViewController(index: Int,
                                  file: StaticString = #file,
                                  line: UInt = #line) -> UIViewController? {
        if index >= setableViewControllers.count {
            XCTFail("Invalid index", file: file, line: line)
            return nil
        } else {
            return setableViewControllers[index]
        }
    }
}

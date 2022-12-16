//
//  UIResponder+Extension.swift
//  TMDBViewer
//
//  Created by Gabriel Targon on 16/12/22.
//

import UIKit

extension UIResponder {
  
  func getOwningViewController() -> UIViewController? {
    var nextResponser = self
    while let next = nextResponser.next {
      nextResponser = next
      if let viewController = nextResponser as? UIViewController {
        return viewController
      }
    }
    return nil
  }
}

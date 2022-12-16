//
//  ImageConstants.swift
//  TMDBViewer
//
//  Created by Gabriel Targon on 15/12/22.
//

import Foundation
import UIKit

enum LoginImages: String {
    case background = "login-background"
    
    var raw: UIImage {
        return UIImage(named: self.rawValue) ?? UIImage()
    }
}

enum CommonImages: String {
    case placeholder = "movie-placeholder"
    
    var raw: UIImage {
        return UIImage(named: self.rawValue) ?? UIImage()
    }
}

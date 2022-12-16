//
//  ImageConstants.swift
//  TMDBViewer
//
//  Created by Gabriel Targon on 15/12/22.
//

import Foundation
import UIKit

enum CommonImage: String {
    case placeholder = "movie-placeholder"
    
    var raw: UIImage {
        return UIImage(named: self.rawValue) ?? UIImage()
    }
}

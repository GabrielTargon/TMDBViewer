//
//  LocalizationProtocol.swift
//  TMDBViewer
//
//  Created by Gabriel Targon on 16/12/22.
//

import Foundation

protocol LocalizationProtocol {
    var rawValue: String { get }
    var localized: String { get }
}

extension LocalizationProtocol {
    
    var table: String { "Localizable" }
    
    var localized: String {
        let bundle = Bundle(for: AppDelegate.self)
        return bundle.localizedString(forKey: rawValue,
                                      value: nil,
                                      table: table)
    }
    
}

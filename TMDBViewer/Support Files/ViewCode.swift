//
//  ViewCode.swift
//  TMDBViewer
//
//  Created by Gabriel Targon on 19/10/22.
//

import Foundation

protocol ViewCode {
    
    /// Creation of the views hierarchy
    func setupHierarchy()
    
    /// Creation and activation of constraints
    func setupConstraints()
    
    /// Configurations of the view
    func setupConfigurations()
}

extension ViewCode {
    func setupView() {
        setupHierarchy()
        setupConstraints()
        setupConfigurations()
    }
    
    func setupConfigurations() {
        // Default implementation
    }
}

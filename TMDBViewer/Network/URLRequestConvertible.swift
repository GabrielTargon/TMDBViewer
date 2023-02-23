//
//  URLRequestConvertible.swift
//  TMDBViewer
//
//  Created by Gabriel Targon on 22/02/23.
//

import Foundation

public protocol URLRequestConvertible {
    func asURLRequest() throws -> URLRequest
}

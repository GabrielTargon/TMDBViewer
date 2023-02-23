//
//  HTTPRequestParams.swift
//  TMDBViewer
//
//  Created by Gabriel Targon on 22/02/23.
//

import Foundation

enum HTTPMethod: String {
    case post = "POST"
    case put = "PUT"
    case get = "GET"
    case delete = "DELETE"
}

protocol HTTPRequestParams: URLRequestConvertible {
    
    var baseURL: String { get }
    
    var path: String { get }
    
    var parameters: [String: Any]? { get }
    
    var method: HTTPMethod { get }
}

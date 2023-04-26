//
//  TMDBEndpoint.swift
//  TMDBViewer
//
//  Created by Gabriel Targon on 22/02/23.
//

import Foundation

struct TMDBEndpoint: HTTPRequestParams {
    var path: String
    var method: HTTPMethod
    
    var parameters: [String : Any] = [TMDBAPIConstants.PARAMETER_API_KEY: TMDBAPIConstants.API_KEY] {
        didSet {
            parameters = oldValue.merging(parameters) { (current, _) in current }
        }
    }
    
    var baseURL: String {
        return TMDBAPIConstants.BASE_URL
    }
    
    init(path: String, method: HTTPMethod) {
        self.path = path
        self.method = method
    }
}

extension TMDBEndpoint {
    
    func asURLRequest() throws -> URLRequest {
        guard var url = URL(string: baseURL) else {
            throw NetworkError.invalidURL
        }
        url = url.appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.timeoutInterval = 10.0
        request.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        request.httpMethod = method.rawValue
        
        configureUrlParameters(parameters, url: url, request: &request)
        
        request.setValue(TMDBAPIConstants.HEADER_CONTENT_TYPE,
                         forHTTPHeaderField: TMDBAPIConstants.HEADER_CONTENT_TYPE_KEY)
        return request
    }
}

private extension TMDBEndpoint {
    
    func configureUrlParameters(_ parameters: [String: Any], url: URL, request: inout URLRequest) {
        if var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) {
            urlComponents.queryItems = [URLQueryItem]()
            
            parameters.forEach { (key, value) in
                let queryItem = URLQueryItem(name: key, value: "\(value)".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed))
                urlComponents.queryItems?.append(queryItem)
            }
            
            request.url = urlComponents.url
        }
    }
}

//
//  TMDBEndpoint.swift
//  TMDBViewer
//
//  Created by Gabriel Targon on 22/02/23.
//

import Foundation

enum TMDBEndpoint {
    case requestToken
    case login(String, String, String)
    case movies(String)
    case movie(Int)
}

extension TMDBEndpoint: HTTPRequestParams {
    var baseURL: String {
        return TMDBAPIConstants.BASE_URL
    }
    
    var path: String {
        switch self {
        case .requestToken:
            return "authentication/token/new"
        case .login:
            return "authentication/token/validate_with_login"
        case .movies(let category):
            return "movie/\(category)"
        case .movie(let id):
            return "movie/\(id)"
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .login(let username, let password, let requestToken):
            let parameters = [TMDBAPIConstants.PARAMETER_USERNAME : username,
                              TMDBAPIConstants.PARAMETER_PASSWORD : password,
                              TMDBAPIConstants.PARAMETER_REQUEST_TOKEN : requestToken]
            return defaultParameter().merging(parameters) { (current, _) in current }
        case .movie:
            let parameters = [TMDBAPIConstants.PARAMETER_MOVIE_APPEND : "credits"]
            return defaultParameter().merging(parameters) { (current, _) in current }
        default:
            return defaultParameter()
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        default:
            return .get
        }
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
        
        if let parameters = parameters, parameters.count > 0 {
            configureUrlParameters(parameters, url: url, request: &request)
        }
        request.setValue(TMDBAPIConstants.HEADER_CONTENT_TYPE,
                         forHTTPHeaderField: TMDBAPIConstants.HEADER_CONTENT_TYPE_KEY)
        return request
    }
}

private extension TMDBEndpoint {
    
    func defaultParameter() -> [String : Any] {
        return [TMDBAPIConstants.PARAMETER_API_KEY: TMDBAPIConstants.API_KEY]
    }
    
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

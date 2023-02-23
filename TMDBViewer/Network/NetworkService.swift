//
//  NetworkService.swift
//  TMDBViewer
//
//  Created by Gabriel Targon on 22/02/23.
//

import Foundation

class NetworkService {
    
    let session = URLSession.shared
    
    static func makeRequest<T:Codable>(_ request: HTTPRequestParams,
                                       completion: @escaping (Result<T, NetworkError>) -> Void) {
        let session = URLSession.shared
        do {
            let request = try request.asURLRequest()
            let task = session.dataTask(with: request) { (data, response, error) in
                if let data = data, let responseData: T = NetworkService.decodeFormData(data: data) {
                    DispatchQueue.main.async {completion(.success(responseData))}
                } else {
                    DispatchQueue.main.async {completion(.failure(.decodeError))}
                }
            }
            task.resume()
        } catch let error {
            guard let error = error as? NetworkError else {
                DispatchQueue.main.async {completion(.failure(.unknown))}
                return
            }
            DispatchQueue.main.async {completion(.failure(error))}
        }
    }
    
    static func decodeFormData<T:Codable>(data: Data) -> T? {
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-mm-dd"
            decoder.dateDecodingStrategy = .formatted(dateFormatter)
            let response = try decoder.decode(T.self, from: data)
            return response
        } catch {
            return nil
        }
    }
}

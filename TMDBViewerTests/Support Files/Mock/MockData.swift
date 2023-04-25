//
//  MockData.swift
//  TMDBViewerTests
//
//  Created by Gabriel Targon on 24/04/23.
//

@testable import TMDBViewer
import Foundation

enum MockDataResult {
    case success
    case failure
    case successJSON(String)
    case failureJSON(String)
}

class MockData: NetworkServiceProviderProtocol {
    
    var expectedResult: MockDataResult = .success
    
    static func makeRequest<T>(_ request: TMDBViewer.HTTPRequestParams,
                               completion: @escaping (Result<T, TMDBViewer.NetworkError>) -> Void) where T : Decodable, T : Encodable {
        
    }
    
    private func handleResult<T: Decodable>(expected: MockDataResult,
                                            isData: Bool = false,
                                            completion: @escaping (Result<T, TMDBViewer.NetworkError>) -> Void) {
        switch expectedResult {
        case .success:
            if let genericValue = "Succeded" as? T {
                completion(.success(genericValue))
            }
        case .failure:
            completion(.failure(NetworkError.unknown))
        case .successJSON(let filename):
            guard let jsonData = loadJSON(file: filename, isData: isData) else {
                completion(.failure(NetworkError.jsonError))
                return
            }
            completion(.success(jsonData as! T))
        case .failureJSON(let filename):
            guard let jsonData = loadJSON(file: filename, isData: isData) else {
                completion(.failure(NetworkError.jsonError))
                return
            }
            completion(.failure(NetworkError.jsonError))
        }
    }
    
    private func loadJSON(file: String, isData: Bool = false) -> Any? {
        guard let path = Bundle.main.path(forResource: file, ofType: "json") else {
            fatalError("JSON file not found")
        }
        
        do {
            let data = try Data(contentsOf: URL(filePath: path),
                                options: .mappedIfSafe)
            
            if isData {
                return data
            }
        } catch {
            fatalError("Could not parse sample file. Log:\(error)")
        }
        return nil
    }
}

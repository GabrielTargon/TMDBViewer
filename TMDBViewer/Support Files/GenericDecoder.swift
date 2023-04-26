//
//  GenericDecoder.swift
//  TMDBViewer
//
//  Created by Gabriel Targon on 23/04/23.
//

import Foundation

final class GenericDecoder {
    static func decoded<T: Decodable>(file: String,
                                      type: String = "json",
                                      decoder: JSONDecoder = JSONDecoder(),
                                      bundle: Bundle) -> T {
        guard let path = bundle.path(forResource: file, ofType: type) else {
            fatalError("JSON file not found")
        }
        
        do {
            let data = try Data(contentsOf: URL(filePath: path),
                                options: .mappedIfSafe)
            
            return try decoder.decode(T.self,
                                      from: data)
        } catch {
            fatalError("Could not parse sample file. Log:\(error)")
        }
    }
}

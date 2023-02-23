//
//  TMDBFetchResponse.swift
//  TMDBViewer
//
//  Created by Gabriel Targon on 23/02/23.
//

import Foundation

struct TMDBFetchResponse<T: Codable>: Codable  {
    let data: TMDBResult<T>
}

struct TMDBResult<T: Codable>: Codable  {
    let results: [T]
}

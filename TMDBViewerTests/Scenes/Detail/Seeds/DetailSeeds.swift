//
//  DetailSeeds.swift
//  TMDBViewerTests
//
//  Created by Gabriel Targon on 26/04/23.
//

@testable import TMDBViewer
import Foundation

struct DetailSeeds {
    
    static let detailRequestStub: Detail.Film.Request = {
        return Detail.Film.Request(id: 297761)
    }()
    
    static let detail: Movie = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        return GenericDecoder.decoded(file: "Movie",
                                      decoder: decoder,
                                      bundle: Bundle(for: DetailViewControllerTests.self))
    }()
}

//
//  NetworkWidgetService.swift
//  TMDBViewer
//
//  Created by Gabriel Targon on 24/02/23.
//

import Foundation
import WidgetKit

struct NetworkWidgetService {
    
    func fetchMoviesList(completion: @escaping (Timeline<SimpleEntry>) -> ()) {
        NetworkService.makeRequest(TMDBEndpoint.movies(Home.Endpoint.nowPlaying.rawValue)) { (response: Result<MoviesResponse, NetworkError>) in
            switch response {
            case .success(let data):
                let entry = SimpleEntry(title: data.results[0].title,
                                        imageURL: data.results[0].posterURL)
                let timeline = Timeline(entries: [entry], policy: .atEnd)
                completion(timeline)
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

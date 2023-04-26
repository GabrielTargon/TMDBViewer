//
//  HomeInteractor.swift
//  TMDBViewer
//
//  Created by Gabriel Targon on 19/10/22.
//

import UIKit

protocol HomeBusinessLogic {
    func requestMoviesList(request: Home.Movies.Request)
}

protocol HomeDataStore {}

class HomeInteractor: HomeBusinessLogic, HomeDataStore {
    var presenter: HomePresentationLogic?
    var worker: HomeWorkLogic?
    
    // MARK: Requests
    
    func requestMoviesList(request: Home.Movies.Request) {
        worker?.fetchMovies(endpoint: request.endpoint,
                            params: nil) { [weak self] result in
            switch result {
            case .success(let response):
                let response = Home.Movies.Response(movies: response)
                self?.presenter?.presentMovies(response: response)
            case .failure(let error):
                self?.presenter?.presentError(description: error.localizedDescription)
            }
        }
        
        
    }
}

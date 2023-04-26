//
//  DetailInteractor.swift
//  TMDBViewer
//
//  Created by Gabriel Targon on 20/10/22.
//

import UIKit

protocol DetailBusinessLogic {
    func requestMovie(request: Detail.Film.Request)
}

protocol DetailDataStore {
    var id: Int { get set }
}

class DetailInteractor: DetailBusinessLogic, DetailDataStore {
    var presenter: DetailPresentationLogic?
    var worker: DetailWorkLogic?
    
    var id: Int = Int()
    
    func requestMovie(request: Detail.Film.Request) {
        worker?.fetchMovie(id: request.id, result: { [weak self] result in
            switch result {
            case .success(let response):
                let response = Detail.Film.Response(movie: response)
                self?.presenter?.presentMovie(response: response)
            case .failure(let error):
                self?.presenter?.presentError(description: error.localizedDescription)
            }
        })
    }
}

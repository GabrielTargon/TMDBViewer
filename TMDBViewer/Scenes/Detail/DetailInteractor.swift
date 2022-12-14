//
//  DetailInteractor.swift
//  TMDBViewer
//
//  Created by Gabriel Targon on 20/10/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
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
    var worker: DetailWorker?
    
    var id: Int = Int()
    
    func requestMovie(request: Detail.Film.Request) {
        worker = DetailWorker()
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

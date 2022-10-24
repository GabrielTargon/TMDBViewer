//
//  DetailViewController.swift
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

protocol DetailDisplayLogic: AnyObject {
    func displayMovieInfo(viewModel: Detail.Film.ViewModel)
    func displayError(description: String)
}

class DetailViewController: UIViewController, DetailDisplayLogic {
    var interactor: DetailBusinessLogic?
    var router: (NSObjectProtocol & DetailRoutingLogic & DetailDataPassing)?
    
    let detailView = DetailView()
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = DetailInteractor()
        let presenter = DetailPresenter()
        let router = DetailRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        resquestMovie()
    }
    
    // MARK: Private functions
    
    func resquestMovie() {
        guard let id = router?.dataStore?.id else {
            return
        }
        let request = Detail.Film.Request(id: id)
        interactor?.requestMovie(request: request)
    }
    
    // MARK: Public functions
    
    func displayMovieInfo(viewModel: Detail.Film.ViewModel) {
        detailView.setView(viewModel: viewModel)
    }
    
    func displayError(description: String) {
        router?.routeToError(description: description)
    }
}

extension DetailViewController: ViewCode {
    func setupHierarchy() {
        view = detailView
    }
    
    func setupConstraints() {
        // No Constraints needed
    }
    
    func setupConfigurations() {
        // Navigation Bar
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = .clear
        navigationController?.navigationBar.tintColor = .white
    }
}

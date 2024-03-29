//
//  HomeViewController.swift
//  TMDBViewer
//
//  Created by Gabriel Targon on 19/10/22.
//

import UIKit

protocol HomeDisplayLogic: AnyObject {
    func displayMovies(viewModel: Home.Movies.ViewModel)
    func displayError(description: String)
}

class HomeViewController: UIViewController, HomeDisplayLogic {
    var interactor: HomeBusinessLogic?
    var router: (HomeRoutingLogic & HomeDataPassing)?
    
    let homeView = HomeView()
    
    var moviesData = [Home.Movie]()
    
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
        let interactor = HomeInteractor()
        let presenter = HomePresenter()
        let router = HomeRouter()
        let worker = HomeWorker()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        interactor.worker = worker
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        interactor?.requestMoviesList(request: Home.Movies.Request(endpoint: Home.Endpoint.nowPlaying))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Navigation Bar
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.view.backgroundColor = .tmdbDark85
        navigationController?.navigationBar.barTintColor = .tmdbDark85
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.setHidesBackButton(true, animated: true)
    }
    
    // MARK: Private functions
    
    private func stopLoading() {
        homeView.loadingIndicator.stopAnimating()
    }
    
    // MARK: Public functions
    
    func displayMovies(viewModel: Home.Movies.ViewModel) {
        moviesData = viewModel.movies
        
        homeView.collectionView.reloadData()
        stopLoading()
    }
    
    func displayError(description: String) {
        router?.routeToError(description: description)
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        let movieID = moviesData[indexPath.row].id
        
        router?.routeToMovieDetail(id: movieID)
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return moviesData.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: homeView.cellIdentifier, for: indexPath) as? HomeMovieCell else {
            return UICollectionViewCell()
        }
        
        cell.setCellValues(movie: moviesData[indexPath.row])
        
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.size.width * 0.46
        
        return CGSize(width: width, height: 350)
    }
}

extension HomeViewController: ViewCode {
    func setupHierarchy() {
        view = homeView
    }
    
    func setupConstraints() {
        //No Constraints neeeded
    }
    
    func setupConfigurations() {
        navigationItem.title = HomeStrings.title.localized
        
        // Delegates
        homeView.collectionView.delegate = self
        homeView.collectionView.dataSource = self
    }
}

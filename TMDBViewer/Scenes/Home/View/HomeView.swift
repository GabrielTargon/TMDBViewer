//
//  HomeView.swift
//  TMDBViewer
//
//  Created by Gabriel Targon on 19/10/22.
//

import UIKit

final class HomeView: UIView {
    
    var cellIdentifier = String(describing: HomeMovieCell.self)
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero,
                                          collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(HomeMovieCell.self,
                            forCellWithReuseIdentifier: cellIdentifier)
        collection.backgroundColor = .clear
        return collection
    }()
    
    lazy var loadingIndicator: UIActivityIndicatorView = {
        let loading = UIActivityIndicatorView()
        loading.translatesAutoresizingMaskIntoConstraints = false
        loading.hidesWhenStopped = true
        loading.style = .large
        loading.color = .white
        loading.backgroundColor = UIColor(white: 0,
                                          alpha: 0.7)
        loading.startAnimating()
        return loading
    }()
    
    // MARK: Lifecycle
    
    init() {
        super.init(frame: .zero)
        setupView()
        UIViewController().loadViewIfNeeded()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeView: ViewCode {
    func setupHierarchy() {
        addSubview(collectionView)
        addSubview(loadingIndicator)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor,
                                                constant: 9),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                    constant: 9),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                     constant: -9),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            loadingIndicator.topAnchor.constraint(equalTo: topAnchor),
            loadingIndicator.leadingAnchor.constraint(equalTo: leadingAnchor),
            loadingIndicator.trailingAnchor.constraint(equalTo: trailingAnchor),
            loadingIndicator.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setupConfigurations() {
        backgroundColor = .tmdbAlmostBlack
    }
}

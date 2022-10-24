//
//  HomeMovieCell.swift
//  TMDBViewer
//
//  Created by Gabriel Targon on 19/10/22.
//

import UIKit

class HomeMovieCell: UICollectionViewCell {
    
    private lazy var backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .tmdbDark
        return view
    }()
    
    private lazy var movieImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var movieTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.textColor = .tmdbAlgaeGreen
        return label
    }()
    
    private lazy var movieDate: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = .tmdbAlgaeGreen
        return label
    }()
    
    private lazy var movieRating: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = .tmdbAlgaeGreen
        return label
    }()
    
    private lazy var movieDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    // MARK: Public functions
    
    func setCellValues(movie: Home.Movie) {
        movieImage.load(url: movie.image)
        movieTitle.text = movie.title
        movieDate.text = movie.date
        movieRating.text = movie.rating
        movieDescription.text = movie.description
    }
}

extension HomeMovieCell: ViewCode {
    func setupHierarchy() {
        addSubview(backView)
        addSubview(movieImage)
        addSubview(movieTitle)
        addSubview(movieDate)
        addSubview(movieRating)
        addSubview(movieDescription)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: topAnchor),
            backView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            movieImage.topAnchor.constraint(equalTo: topAnchor),
            movieImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            movieImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            movieImage.heightAnchor.constraint(equalToConstant: 230),
        ])
        NSLayoutConstraint.activate([
            movieTitle.topAnchor.constraint(equalTo: movieImage.bottomAnchor,
                                            constant: 10),
            movieTitle.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                constant: 8),
            movieTitle.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                 constant: -8),
            movieTitle.heightAnchor.constraint(equalToConstant: 16),
        ])
        
        NSLayoutConstraint.activate([
            movieDate.topAnchor.constraint(equalTo: movieTitle.bottomAnchor,
                                           constant: 10),
            movieDate.leadingAnchor.constraint(equalTo: leadingAnchor,
                                               constant: 8),
            movieDate.trailingAnchor.constraint(equalTo: movieRating.leadingAnchor,
                                                constant: 8),
            movieDate.heightAnchor.constraint(equalToConstant: 16),
        ])
        
        NSLayoutConstraint.activate([
            movieRating.widthAnchor.constraint(equalToConstant: 30),
            movieRating.topAnchor.constraint(equalTo: movieDate.topAnchor),
            movieRating.bottomAnchor.constraint(equalTo: movieDate.bottomAnchor),
            movieRating.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                  constant: -8),
        ])
        
        NSLayoutConstraint.activate([
            movieDescription.topAnchor.constraint(equalTo: movieDate.bottomAnchor,
                                                  constant: 10),
            movieDescription.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                      constant: 8),
            movieDescription.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                       constant: -8),
            movieDescription.bottomAnchor.constraint(equalTo: bottomAnchor,
                                                     constant: -8),
            movieDescription.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    func setupConfigurations() {
        backgroundColor = .clear
        
        layer.masksToBounds = true
        layer.cornerRadius = 10
    }
}

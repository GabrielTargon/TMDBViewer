//
//  DetailView.swift
//  TMDBViewer
//
//  Created by Gabriel Targon on 20/10/22.
//

import UIKit
import Kingfisher

final class DetailView: UIView {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .clear
        scrollView.contentInsetAdjustmentBehavior = .never
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var movieImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    private lazy var rateView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .tmdbAlgaeGreen
        view.layer.cornerRadius = 20
        return view
    }()
    
    private lazy var rateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private lazy var backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .tmdbDark
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var summaryTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .tmdbAlgaeGreen
        label.text = "Summary"
        return label
    }()
    
    private lazy var movieTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()
    
    private lazy var movieDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var movieReleaseTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .tmdbAlgaeGreen
        label.text = "Release"
        return label
    }()
    
    private lazy var movieRelease: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .white
        return label
    }()
    
    private lazy var movieGenresTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .tmdbAlgaeGreen
        label.text = "Genres"
        return label
    }()
    
    private lazy var movieGenres: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var castTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .tmdbAlgaeGreen
        label.text = "Cast"
        return label
    }()
    
    private lazy var castLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var vStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [summaryTitle,
                                                   movieTitle,
                                                   movieDescription,
                                                   movieReleaseTitle,
                                                   movieRelease,
                                                   movieGenresTitle,
                                                   movieGenres,
                                                   castTitle,
                                                   castLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .leading
        stack.axis = .vertical
        stack.spacing = 15
        return stack
    }()
    
    lazy var loadingIndicator: UIActivityIndicatorView = {
        let loading = UIActivityIndicatorView()
        loading.translatesAutoresizingMaskIntoConstraints = false
        loading.hidesWhenStopped = true
        loading.style = .large
        loading.color = .white
        loading.backgroundColor = UIColor(white: 0, alpha: 0.7)
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
    
    // MARK: Public functions
    
    func setView(viewModel: Detail.Film.ViewModel) {
        movieImage.kf.setImage(with: viewModel.backdropImageURL,
                               placeholder: CommonImage.placeholder.raw)
        movieTitle.text = viewModel.title
        rateLabel.text = viewModel.rate
        movieDescription.text = viewModel.description
        movieRelease.text = viewModel.date
        movieGenres.text = viewModel.genres
        castLabel.text = viewModel.cast
        loadingIndicator.stopAnimating()
    }
}

extension DetailView: ViewCode {
    func setupHierarchy() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(movieImage)
        contentView.addSubview(backView)
        contentView.addSubview(rateView)
        contentView.addSubview(rateLabel)
        backView.addSubview(vStack)
        addSubview(loadingIndicator)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(greaterThanOrEqualTo: scrollView.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            movieImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            movieImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            movieImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            movieImage.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: movieImage.bottomAnchor,
                                          constant: -30),
            backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                              constant: 25),
            backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                               constant: -25),
            backView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            rateView.widthAnchor.constraint(equalToConstant: 40),
            rateView.heightAnchor.constraint(equalToConstant: 40),
            rateView.centerYAnchor.constraint(equalTo: backView.topAnchor),
            rateView.trailingAnchor.constraint(equalTo: backView.trailingAnchor,
                                               constant: -30),
        ])
        
        NSLayoutConstraint.activate([
            rateLabel.topAnchor.constraint(equalTo: rateView.topAnchor),
            rateLabel.bottomAnchor.constraint(equalTo: rateView.bottomAnchor),
            rateLabel.leadingAnchor.constraint(equalTo: rateView.leadingAnchor),
            rateLabel.trailingAnchor.constraint(equalTo: rateView.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: backView.topAnchor,
                                        constant: 20),
            vStack.leadingAnchor.constraint(equalTo: backView.leadingAnchor,
                                            constant: 24),
            vStack.trailingAnchor.constraint(equalTo: backView.trailingAnchor,
                                             constant: -11),
            vStack.bottomAnchor.constraint(equalTo: backView.bottomAnchor)
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


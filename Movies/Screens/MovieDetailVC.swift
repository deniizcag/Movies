//
//  MovieDetailVC.swift
//  Movies
//
//  Created by DenizCagilligecit on 16.08.2020.
//  Copyright © 2020 garage. All rights reserved.
//

import UIKit

class MovieDetailVC: UIViewController {
    
    var mainContainerView = UIView()
    var movieImage = UIImageView()
    var detailView = UIView()
    var stackView = UIStackView()
    var overviewHeader = MovTitleLabel(fontSize: 17, alignment: .center, weight: .regular)
    var movieLabel = MovTitleLabel(fontSize: 25, alignment: .center,weight: .medium)
    var movieOverview = MovBodyLabel(textAlignment: .left)
    var yearLabel = MovSubtitleLabel()
    var ratingLabel = MovSubtitleLabel()
    var ratingImage = UIImageView()
    var genderLabel = MovSubtitleLabel()
    var favoriteButton = MovButton(title: "Add to Favorites", backgroundColor: .blue)
    
    var ratingStackView = UIStackView()
    
    var movie:Movie
    
    init(movie: Movie){
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureViewController()
        configureMainContainerView()
        configureImageView()
        configureDetailContainerView()
        configureMovieLabel()
        configureStackView()
        configureoverviewHeader()
        configureMovieOverview()
        configureFavoriteButton()
    }
    func configureFavoriteButton() {
        
        favoriteButton.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
        NSLayoutConstraint.activate([
            favoriteButton.bottomAnchor.constraint(equalTo: detailView.bottomAnchor, constant: -12),
            favoriteButton.leadingAnchor.constraint(equalTo: movieLabel.leadingAnchor),
            favoriteButton.trailingAnchor.constraint(equalTo: movieLabel.trailingAnchor),
            favoriteButton.heightAnchor.constraint(equalToConstant: 60)
            
        ])
        
        
        
    }
    @objc func addButtonPressed() {
        PersistenceManager.updateWith(favorite: movie, actionType: .add) { (error) in
            if error != nil {
                self.presentMovAlertOnTheMainThread(title: "Something went wrong", message:error!.rawValue, buttonTitle: "Ok")
                
            }
            else {
                self.presentMovAlertOnTheMainThread(title: "Success", message: "You added this movie in your favorites ", buttonTitle: "Ok")
            }
        }
    }
    
    func configureMovieOverview() {
        movieOverview.contentMode = .topLeft
        
        movieOverview.text = movie.overview
        movieOverview.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            movieOverview.topAnchor.constraint(equalTo: overviewHeader.bottomAnchor),
            movieOverview.leadingAnchor.constraint(equalTo: movieLabel.leadingAnchor),
            movieOverview.trailingAnchor.constraint(equalTo: movieLabel.trailingAnchor),
            //movieOverview.heightAnchor.constraint(equalToConstant: 200)
        ])
        
    }
    
    func configureoverviewHeader() {
        overviewHeader.text = "Overview"
        NSLayoutConstraint.activate([
            overviewHeader.topAnchor.constraint(equalTo: stackView.bottomAnchor),
            overviewHeader.leadingAnchor.constraint(equalTo: movieLabel.leadingAnchor),
            overviewHeader.heightAnchor.constraint(equalToConstant: 30),
            
        ])
    }
    func configureRatingStackView() {
        
        ratingStackView.translatesAutoresizingMaskIntoConstraints = false
        ratingStackView.axis = .horizontal
        ratingStackView.distribution = .equalSpacing
        ratingStackView.spacing = 3
        
        ratingStackView.addArrangedSubview(ratingImage)
        ratingStackView.addArrangedSubview(ratingLabel)
        
    }
    
    func configureStackView() {
        
        
        let releaseYear = String(movie.releaseDate!.prefix(4))
        let ratingVote = String(movie.voteAverage)
        
        configureRatingStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 5
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        yearLabel.text = releaseYear
        ratingLabel.text = ratingVote
        
        let text = PersistenceManager.getGenders(in: movie.genreIds)
        
        genderLabel.text = text
        ratingImage.image = UIImage(systemName: "star.fill")
        ratingImage.contentMode = .scaleAspectFit
        
        
        stackView.addArrangedSubview(yearLabel)
        stackView.addArrangedSubview(genderLabel)
        stackView.addArrangedSubview(ratingStackView)
        
        NSLayoutConstraint.activate([
            
            stackView.topAnchor.constraint(equalTo: movieLabel.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: movieLabel.leadingAnchor,constant: 40),
            stackView.trailingAnchor.constraint(equalTo: movieLabel.trailingAnchor,constant: -40),
            stackView.heightAnchor.constraint(equalToConstant:  20)
            
        ])
        
        
    }
    
    func configureViewController() {
        self.navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(addTapped))
        self.navigationController?.navigationBar.barTintColor = .systemBackground
      
    }
    @objc func addTapped() {
        dismiss(animated: true)
    }
    
    func configureMainContainerView() {
        //view.layer.cornerRadius = 30
        
        view.backgroundColor = .systemBackground
        mainContainerView.backgroundColor = .systemBackground
        mainContainerView.layer.masksToBounds = true
        //mainContainerView.layer.cornerRadius = 30
        
        view.addSubview(mainContainerView)
        mainContainerView.addSubviews(movieImage,detailView)
        mainContainerView.pinToEdges(of: view)
   
    }
    func configureDetailContainerView() {
        
        detailView.addSubviews(movieLabel,overviewHeader,stackView,movieOverview,favoriteButton)
        detailView.translatesAutoresizingMaskIntoConstraints = false
        //detailView.backgroundColor = .clear
        
        NSLayoutConstraint.activate([
            
            detailView.topAnchor.constraint(equalTo: movieImage.bottomAnchor),
            detailView.leadingAnchor.constraint(equalTo: mainContainerView.leadingAnchor),
            detailView.trailingAnchor.constraint(equalTo: mainContainerView.trailingAnchor),
            detailView.bottomAnchor.constraint(equalTo: mainContainerView.bottomAnchor)
            
        ])
        
    }
    
    
    func configureImageView() {
        movieImage.layer.masksToBounds = true
        movieImage.clipsToBounds = true
        
        getImage()
        movieImage.translatesAutoresizingMaskIntoConstraints = false
        movieImage.contentMode = .scaleAspectFill
        //movieImage.layer.cornerRadius = 50
        NSLayoutConstraint.activate([
            movieImage.topAnchor.constraint(equalTo: mainContainerView.topAnchor),
            movieImage.leadingAnchor.constraint(equalTo: mainContainerView.safeAreaLayoutGuide.leadingAnchor),
            movieImage.trailingAnchor.constraint(equalTo: mainContainerView.safeAreaLayoutGuide.trailingAnchor),
            movieImage.heightAnchor.constraint(equalToConstant: 350),
        ])
        
        
    }
    func configureMovieLabel() {
        movieLabel.text = movie.title
        movieLabel.numberOfLines = 2
        NSLayoutConstraint.activate([
            movieLabel.topAnchor.constraint(equalTo: detailView.topAnchor),
            movieLabel.leadingAnchor.constraint(equalTo: mainContainerView.leadingAnchor,constant: 15),
            movieLabel.trailingAnchor.constraint(equalTo: mainContainerView.trailingAnchor,constant: -15),
            movieLabel.heightAnchor.constraint(equalToConstant: 40),
        ])
        
        
        
        
    }
    
    func getTestImage() {
        DispatchQueue.main.async {
            self.movieImage.image = UIImage(named: "placeholder.jpg")
        }
    }
    func getImage() {
        
        let imagePath = movie.backdropPath ?? "placeholder.jpg"
        NetworkManager.shared.getMovieImage(posterPath: imagePath) {[weak self] (image) in
            guard let self = self else { return }
            if image != nil {
                DispatchQueue.main.async {
                    self.movieImage.image = image
                }
            } else  {
                DispatchQueue.main.async {
                    self.movieImage.image = UIImage(named: imagePath)
                }
            }
        }
    }
    
    
}

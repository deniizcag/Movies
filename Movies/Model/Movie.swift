//
//  Movie.swift
//  Movies
//
//  Created by DenizCagilligecit on 7.08.2020.
//  Copyright © 2020 garage. All rights reserved.
//

import Foundation

struct Results: Codable,Hashable {
    let results: [Movie]
    
}

struct Movie:Codable,Hashable {
    
    let backdropPath: String?
    let title: String
    let id: Int
    var voteAverage: Double
    let overview: String
    let releaseDate: String?
    let posterPath: String?
    let genreIds:[Int]
    
    
    
    init(title: String,id: Int,voteAverage: Double,overview: String,releaseDate: String,posterPath: String,genreIds: [Int],backdropPath: String) {
        self.backdropPath   = backdropPath
        self.title          = title
        self.id             = id
        self.overview       = overview
        self.releaseDate    = releaseDate
        self.posterPath     = posterPath
        self.voteAverage    = voteAverage
        self.genreIds       = genreIds
    }
  
}

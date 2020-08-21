//
//  MovError.swift
//  Movies
//
//  Created by DenizCagilligecit on 7.08.2020.
//  Copyright © 2020 garage. All rights reserved.
//

import Foundation

enum MovError: String,Error {
    
    case invalidRequest   = "Invalid request. Please check URL"
    case invalidResponse  = "Check your internet connection"
    case unableToComplete = "Request can't be completed"
    case invalidData      = "Invalid Data"
    case unableToParse    = "JSON can not be parsed"
    case unableToFavorite = "This user can not be added to favorites"
    case alreadyExists    = "Unable to favorite. You already favorited this movie!"
}

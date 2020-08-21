//
//  Genre.swift
//  Movies
//
//  Created by DenizCagilligecit on 16.08.2020.
//  Copyright © 2020 garage. All rights reserved.
//

import Foundation

struct Genre:Codable,Hashable {
    let id: Int
    let name: String
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}
struct AllGenres: Codable,Hashable {
    let genres: [Genre]
}

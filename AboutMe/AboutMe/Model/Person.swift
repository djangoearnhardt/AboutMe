//
//  Person.swift
//  AboutMe
//
//  Created by Sam LoBue on 9/17/19.
//  Copyright © 2019 DjangoEarnhardt. All rights reserved.
//

import UIKit

// the picture will use the name string to instantiate 
class Person: Codable {
    
    let name: String
    let origin: String
    let favoriteMovie: String
    let favoriteSuperHero: String
    var isFavorite: Bool
    
    init(name: String, origin: String, favoriteMovie: String, favoriteSuperHero: String, isFavorite: Bool) {
        
        self.name = name
        self.origin = origin
        self.favoriteMovie = funFact
        self.favoriteSuperHero = favoriteSuperHero
    }
}


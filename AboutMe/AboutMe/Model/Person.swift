//
//  Person.swift
//  AboutMe
//
//  Created by Sam LoBue on 9/17/19.
//  Copyright © 2019 DjangoEarnhardt. All rights reserved.
//

import UIKit

// the picture will use the name string to instantiate 
class Person {
    
    let name: String
    let origin: String
    let funFact: String
    let favoriteSuperHero: String
    var isFavorite: Bool?
    
    init(name: String, origin: String, funFact: String, favoriteSuperHero: String, isFavorite: Bool) {
        
        self.name = name
        self.origin = origin
        self.funFact = funFact
        self.favoriteSuperHero = favoriteSuperHero
    }
}

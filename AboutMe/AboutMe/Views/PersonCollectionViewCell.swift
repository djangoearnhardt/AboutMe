//
//  PersonCollectionViewCell.swift
//  AboutMe
//
//  Created by Ian Hall on 9/17/19.
//  Copyright © 2019 DjangoEarnhardt. All rights reserved.
//

import UIKit

class PersonCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var originLabel: UILabel!
    
    @IBOutlet weak var movieLabel: UILabel!
    
    @IBOutlet weak var superHeroLabel: UILabel!

    @IBOutlet weak var profileImageView: UIImageView!

    @IBOutlet weak var favMovieDisplay: UILabel!
    
    @IBOutlet weak var originDisplayLabel: UILabel!
    
    func update(person:Person){
        nameLabel.text = person.name
        originLabel.text = person.origin
        movieLabel.text = person.favoriteMovie
        superHeroLabel.text = person.favoriteSuperHero
        profileImageView.image = UIImage(named: person.name)
        profileImageView.addCircleShape()
        originDisplayLabel.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "Dynamic Yellow"))
        favMovieDisplay.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "Powerful Tangerine"))
        nameLabel.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "SuperHeroBlue"))
    }
}

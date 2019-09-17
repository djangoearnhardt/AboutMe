//
//  StyleGuide.swift
//  AboutMe
//
//  Created by Sam LoBue on 9/17/19.
//  Copyright © 2019 DjangoEarnhardt. All rights reserved.
//

import UIKit

extension UIView {
    
    func addCircleShape() {
        
        layer.masksToBounds = true
        layer.cornerRadius = frame.width / 2
    }
    
}

extension UIColor {
    
    static let daringRed = UIColor(named: "daringRed")!
    static let dynamicYellow = UIColor(named: "dynamicYellow")!
    static let powerfulTangerine = UIColor(named: "powerfulTangerine")!
    static let superheroBlue = UIColor(named: "superheroBlue")!
}

struct FontName {
    
    static let nunitoRegular = "Nunito-Regular"
}

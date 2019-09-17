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
    
    func addAccentBorder(width: CGFloat = 1.5, color: UIColor = .flashGordonGold) {
        
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }
    
}

extension UIColor {
    
    static let daringRed = UIColor(named: "daringRed")!
    static let dynamicYellow = UIColor(named: "dynamicYellow")!
    static let powerfulTangerine = UIColor(named: "powerfulTangerine")!
    static let superheroBlue = UIColor(named: "superheroBlue")!
    static let flashGordonGold = UIColor(named: "flashGordonGold")!
}

struct FontName {
    
    static let nunitoRegular = "Nunito-Regular"
}

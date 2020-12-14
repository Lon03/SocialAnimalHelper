//
//  UIColor+AnimalHelper.swift
//  AnimalHelper
//
//  Created by Mike Martyniuk on 11/30/19.
//  Copyright © 2019 animalHelper. All rights reserved.
//

import UIKit


extension UIColor {

    static func primary() -> UIColor {
        return #colorLiteral(red: 0.0002446922299, green: 0.7923569083, blue: 0.6168457866, alpha: 1)
    }

    static func enabled() -> UIColor {
        return #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
    
//    static func primaryDark() -> UIColor {
//        return themeService.type.associatedObject.primaryDark
//    }
//
//    static func secondary() -> UIColor {
//        return themeService.type.associatedObject.secondary
//    }
//
//    static func secondaryDark() -> UIColor {
//        return themeService.type.associatedObject.secondaryDark
//    }
//
//    static func separator() -> UIColor {
//        return themeService.type.associatedObject.separator
//    }
//
//    static func text() -> UIColor {
//        return themeService.type.associatedObject.text
//    }
}
//
//extension UIColor {
//
//    var brightnessAdjustedColor: UIColor {
//        var components = self.cgColor.components
//        let alpha = components?.last
//        components?.removeLast()
//        let color = CGFloat(1-(components?.max())! >= 0.5 ? 1.0 : 0.0)
//        return UIColor(red: color, green: color, blue: color, alpha: alpha!)
//    }
//}

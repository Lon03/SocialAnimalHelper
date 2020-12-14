//
//  UIFont+AnimalHelper.swift
//  AnimalHelper
//
//  Created by Mike Martyniuk on 11/30/19.
//  Copyright © 2019 animalHelper. All rights reserved.
//


import UIKit
import Foundation

// MARK: Fonts

extension UIFont {
    
    static func navigationTitleFont() -> UIFont {
        return UIFont.systemFont(ofSize: 17.0)
    }
    
    static func titleFont() -> UIFont {
        return UIFont.systemFont(ofSize: 17.0)
    }
    
    static func descriptionFont() -> UIFont {
        return UIFont.systemFont(ofSize: 14.0)
    }
}

// MARK: All Fonts

extension UIFont {
    
    static func allSystemFontsNames() -> [String] {
        var fontsNames = [String]()
        let fontFamilies = UIFont.familyNames
        for fontFamily in fontFamilies {
            let fontsForFamily = UIFont.fontNames(forFamilyName: fontFamily)
            for fontName in fontsForFamily {
                fontsNames.append(fontName)
            }
        }
        return fontsNames
    }
}

// MARK: Randomizing Fonts

extension UIFont {
    
    static func randomFont(ofSize size: CGFloat) -> UIFont {
        let allFontsNames = UIFont.allSystemFontsNames()
        let fontsCount = UInt32(allFontsNames.count)
        let randomFontIndex = Int(arc4random_uniform(fontsCount))
        let randomFontName = allFontsNames[randomFontIndex]
        return UIFont(name: randomFontName, size: size)!
    }
}

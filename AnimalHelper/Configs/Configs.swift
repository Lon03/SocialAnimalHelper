//
//  Configs.swift
//  AnimalHelper
//
//  Created by Mike Martyniuk on 11/28/19.
//  Copyright © 2019 animalHelper. All rights reserved.
//

import UIKit

// All keys are demonstrative and used for the test.
enum Keys {
    case mixpanel, adMob
    
    var apiKey: String {
        switch self {
        case .mixpanel: return ""
        case .adMob: return "ca-app-pub"
        }
    }
    
    var appId: String {
        switch self {
        case .mixpanel: return ""
        case .adMob: return ""  // See GADApplicationIdentifier in Info.plist
        }
    }
}

struct Configs {
    
    struct App {
        static let bundleIdentifier = "app.animalshelp.AnimalHelper"
    }
    
    struct Network {
        static let useStaging = false  // set true for tests and generating screenshots with fastlane
        static let loggingEnabled = false
    }
    
    struct BaseDimensions {
        static let inset: CGFloat = 10
        static let tabBarHeight: CGFloat = 58
        static let toolBarHeight: CGFloat = 66
        static let navBarWithStatusBarHeight: CGFloat = 64
        static let cornerRadius: CGFloat = 5
        static let borderWidth: CGFloat = 1
        static let buttonHeight: CGFloat = 40
        static let textFieldHeight: CGFloat = 40
        static let tableRowHeight: CGFloat = 40
        static let segmentedControlHeight: CGFloat = 36
    }
    
    struct Path {
        static let Documents = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        static let Tmp = NSTemporaryDirectory()
    }
    
    struct UserDefaultsKeys {
        static let bannersEnabled = "BannersEnabled"
    }
}

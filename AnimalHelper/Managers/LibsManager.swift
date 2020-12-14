//
//  LibsManager.swift
//  AnimalHelper
//
//  Created by Mike Martyniuk on 03.12.2019.
//  Copyright © 2019 animalHelper. All rights reserved.
//

import Foundation
import IQKeyboardManagerSwift
import NVActivityIndicatorView

/// The manager class for configuring all libraries used in app.
class LibsManager: NSObject {
    
    /// The default singleton instance.
    static let shared = LibsManager()
    
    func setupLibs(with window: UIWindow? = nil) {
        let libsManager = LibsManager.shared
        libsManager.setupKeyboardManager()
        libsManager.setupActivityView()
    }
    
    func setupKeyboardManager() {
        IQKeyboardManager.shared.enable = false
    }
    
    func setupActivityView() {
        NVActivityIndicatorView.DEFAULT_TYPE = .ballClipRotateMultiple
        NVActivityIndicatorView.DEFAULT_COLOR = .primary()
    }
}

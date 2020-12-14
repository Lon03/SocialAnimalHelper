//
//  PresenterType.swift
//  AnimalHelper
//
//  Created by Mike Martyniuk on 14.12.2020.
//  Copyright © 2020 animalHelper. All rights reserved.
//

import Foundation

class PresenterType: NSObject {
    
    let provider: SwiftHubAPI
    
    var page = 1

    init(provider: SwiftHubAPI) {
        self.provider = provider
        super.init()

    }
    
    deinit {
//        logDebug("\(type(of: self)): Deinited")
//        logResourcesCount()
    }
}

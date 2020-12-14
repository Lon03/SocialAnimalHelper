//
//  HomeTabBarProvider.swift
//  AnimalHelper
//
//  Created by Mike Martyniuk on 14.12.2020.
//  Copyright © 2020 animalHelper. All rights reserved.
//

import Foundation
import UIKit

class HomeTabBarPresenter: PresenterType {
    
    
    // MARK: Public methods
    
    private weak var view: HomeTabBarInterface!

    init(view: HomeTabBarInterface, provider: SwiftHubAPI) {
        self.view = view
        super.init(provider: provider)
    }  
}

extension HomeTabBarPresenter: HomeTabBarPresentation {
    
    func transform() -> [HomeTabBarItem] {
        
        return [.news, .location, .create, .notifications, .user]
    }
}

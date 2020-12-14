//
//  HomePresenter.swift
//  AnimalHelper
//
//  Created by Mike Martyniuk on 14.12.2020.
//  Copyright © 2020 animalHelper. All rights reserved.
//

import Foundation
import UIKit

class HomePresenter: PresenterType {
    
    // MARK: Public properties
    
    private weak var view: HomeViewInterface!
    
    // MARK: Public methods
    
    init(view: HomeViewInterface, provider: SwiftHubAPI) {
        self.view = view
        super.init(provider: provider)
    }
}

extension HomePresenter: HomePresentation {

    func onViewDidLoad() {
    }
}

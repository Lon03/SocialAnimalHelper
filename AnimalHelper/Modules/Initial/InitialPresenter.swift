//
//  InitialViewVPresenter.swift
//  AnimalHelper
//
//  Created by Mike Martyniuk on 14.12.2020.
//  Copyright © 2020 animalHelper. All rights reserved.
//

import Foundation
import UIKit

class InitialPresenter: PresenterType {
    
    
    // MARK: Public properties
    
    private weak var view: InitialViewInterface!
    
    
    // MARK: Public methods
    
    init(view: InitialViewInterface, provider: SwiftHubAPI) {
        self.view = view
        super.init(provider: provider)
    }
}

extension InitialPresenter: InitialPresentation {

    
    func onViewDidLoad() {
    }
}

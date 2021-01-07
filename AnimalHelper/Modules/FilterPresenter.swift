//
//  FilterPresenter.swift
//  AnimalHelper
//
//  Created by Mihail Martyniuk on 07.01.2021.
//  Copyright © 2021 animalHelper. All rights reserved.
//

import Foundation
import UIKit

class FilterPresenter: PresenterType {
    
    // MARK: Public properties
    
    weak var view: FilterViewInterface!
    
    private var dataFilterCell: [Int] = [
    ]
    // MARK: Public methods
    
    init(view: FilterViewInterface, provider: SwiftHubAPI) {
        self.view = view
        super.init(provider: provider)
    }
}

extension FilterPresenter: FilterPresentation {

    
    func onViewDidLoad() {
        
    }
    
    func getInfo() -> [Int] {
        return self.dataFilterCell
    }
}

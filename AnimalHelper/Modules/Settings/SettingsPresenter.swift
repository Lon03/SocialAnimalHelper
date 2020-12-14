//
//  SettingsPresenter.swift
//  AnimalHelper
//
//  Created by Mike Martyniuk on 14.12.2020.
//  Copyright © 2020 animalHelper. All rights reserved.
//

import Foundation
import UIKit

class SettingsPresenter: PresenterType {
    
    // MARK: Public properties
    
    weak var view: SettingsViewInterface!
    
    private var dataSettingsCell: [SettingsTypeCell] = [
        .info(title: "Личная информация"),
        .notifications(title: "Уведомления"),
        .help(title: "Помощь"),
        .logOut(title: "Выйти")
    ]
    // MARK: Public methods
    
    init(view: SettingsViewInterface, provider: SwiftHubAPI) {
        self.view = view
        super.init(provider: provider)
    }
}

extension SettingsPresenter: SettingsPresentation {

    
    func onViewDidLoad() {
        
    }
    
    func getInfo() -> [SettingsTypeCell] {
        return self.dataSettingsCell
    }
}

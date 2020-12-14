//
//  SettingsContract.swift
//  AnimalHelper
//
//  Created by Mike Martyniuk on 14.12.2020.
//  Copyright © 2020 animalHelper. All rights reserved.
//


import UIKit

protocol SettingsViewInterface: class {
    func reloadProfile()
    func activityIndicatorChange(_ state: Bool)
}

protocol SettingsPresentation: class {
    func onViewDidLoad()
    func getInfo() ->[SettingsTypeCell]

}

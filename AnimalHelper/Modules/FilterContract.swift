//
//  FilterContract.swift
//  AnimalHelper
//
//  Created by Mihail Martyniuk on 07.01.2021.
//  Copyright © 2021 animalHelper. All rights reserved.
//

import UIKit

protocol FilterViewInterface: class {
    func reloadProfile()
    func activityIndicatorChange(_ state: Bool)
}

protocol FilterPresentation: class {
    func onViewDidLoad()
    func getInfo() ->[FilterTypeCell]

}

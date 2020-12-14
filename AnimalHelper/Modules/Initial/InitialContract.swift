//
//  InitialContract.swift
//  AnimalHelper
//
//  Created by Mike Martyniuk on 14.12.2020.
//  Copyright © 2020 animalHelper. All rights reserved.
//

import UIKit

protocol InitialViewInterface: class {
    func activityIndicatorChange(_ state: Bool)
}

protocol InitialPresentation: class {
    func onViewDidLoad()
}

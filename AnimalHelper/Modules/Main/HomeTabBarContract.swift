//
//  HomeTabBarContract.swift
//  AnimalHelper
//
//  Created by Mike Martyniuk on 14.12.2020.
//  Copyright © 2020 animalHelper. All rights reserved.
//

import Foundation
import UIKit

protocol HomeTabBarInterface: class {}

protocol HomeTabBarPresentation: class {
    func transform() ->[HomeTabBarItem]
}

//
//  NameDescribable.swift
//  AnimalHelper
//
//  Created by Mike Martyniuk on 14.12.2020.
//  Copyright © 2020 animalHelper. All rights reserved.
//

import UIKit

protocol NameDescribable {
    var reuseIdentifier: String { get }
    static var reuseIdentifier: String { get }
}

extension NameDescribable {
    var reuseIdentifier: String {
        return String(describing: type(of: self))
    }

    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

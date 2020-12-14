//
//  UserAvatar.swift
//  AnimalHelper
//
//  Created by Mike Martyniuk on 01.12.2019.
//  Copyright © 2019 animalHelper. All rights reserved.
//

import UIKit

class UserAvatar: UIImageView {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = self.frame.width / 2
        self.layer.borderWidth = 3
        self.layer.borderColor = UIColor.primary().cgColor
    }

}

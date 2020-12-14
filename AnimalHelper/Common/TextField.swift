//
//  TextField.swift
//  AnimalHelper
//
//  Created by Mike Martyniuk on 12/1/19.
//  Copyright © 2019 animalHelper. All rights reserved.
//

import UIKit

class TextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeUI()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        makeUI()
    }
    
    override var placeholder: String? {
        didSet {
        }
    }
    
    func makeUI() {

    }
}

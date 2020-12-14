//
//  BorderButton.swift
//  AnimalHelper
//
//  Created by Mike Martyniuk on 02.12.2019.
//  Copyright © 2019 animalHelper. All rights reserved.
//

import Foundation
import UIKit

public class BorderButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeUI()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        makeUI()
    }
    
    func makeUI() {
        self.layer.cornerRadius = 28
        self.layer.masksToBounds = true
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.primary().cgColor
        self.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        self.setTitleColor(.primary(), for: .normal)
        updateUI()
    }
    
    func updateUI() {
        setNeedsDisplay()
    }
}

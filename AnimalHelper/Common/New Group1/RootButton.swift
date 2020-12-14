//
//  RootButton.swift
//  AnimalHelper
//
//  Created by Mike Martyniuk on 02.12.2019.
//  Copyright © 2019 animalHelper. All rights reserved.
//

import Foundation
import UIKit

public class RootButton: UIButton {
    
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
        self.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        self.backgroundColor = .primary()
        updateUI()
    }
    
    func updateUI() {
        setNeedsDisplay()
    }
}

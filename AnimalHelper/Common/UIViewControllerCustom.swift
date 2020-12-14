//
//  UIViewControllerCustom.swift
//  AnimalHelper
//
//  Created by Mike Martyniuk on 14.12.2020.
//  Copyright © 2020 animalHelper. All rights reserved.
//

import UIKit

import NVActivityIndicatorView

class UIViewControllerCustom: UIViewController {
        
    let activityIndicatorView: NVActivityIndicatorView = {
        let activity = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 45, height: 45), type: .ballClipRotatePulse, color: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1), padding: 0)
        activity.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5)
        activity.clipsToBounds = true
        activity.layer.cornerRadius = 14
        return activity
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setConstraint()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    private func setConstraint() {
        for subview in [activityIndicatorView] {
            subview.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(subview)
        }

        NSLayoutConstraint.activate([
            activityIndicatorView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -35),
            activityIndicatorView.widthAnchor.constraint(equalToConstant: 40),
            activityIndicatorView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
    }
    
}

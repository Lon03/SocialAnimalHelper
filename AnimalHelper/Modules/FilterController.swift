//
//  FilterController.swift
//  AnimalHelper
//
//  Created by Mihail Martyniuk on 07.01.2021.
//  Copyright © 2021 animalHelper. All rights reserved.
//

import UIKit

extension FilterController: FilterViewInterface {
    func reloadProfile() {

    }

    func activityIndicatorChange(_ state: Bool) {
        if state {
            self.activityIndicatorView.startAnimating()
        } else {
            self.activityIndicatorView.stopAnimating()
        }
    }
}


class FilterController: UIViewControllerCustom, Navigatable {
    
    
    private var presenter: FilterPresenter?
    var navigator: Navigator!
    
    
    @IBOutlet weak var userAvatarImg: UIImageView!
    
    @IBOutlet weak var avatarView: UIView!
    
    
    convenience init(navigator: Navigator) {
        self.init()
        self.navigator = navigator
    }
    
    func setPresenter(_ presenter: PresenterType) {
        self.presenter = presenter as? FilterPresenter
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.makeUI()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func makeUI() {
    }
    
}




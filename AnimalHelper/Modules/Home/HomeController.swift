//
//  HomeController.swift
//  AnimalHelper
//
//  Created by Mike Martyniuk on 01.12.2019.
//  Copyright © 2019 animalHelper. All rights reserved.
//

import UIKit

extension HomeController: HomeViewInterface {
    
    func activityIndicatorChange(_ state: Bool) {
        if state {
            self.activityIndicatorView.startAnimating()
        } else {
            self.activityIndicatorView.stopAnimating()
        }
    }
}

class HomeController: UIViewControllerCustom, Navigatable {
    
    private var presenter: HomePresenter?
    var navigator: Navigator!
    
    //    @IBOutlet weak var tableView: UITableView!
    
    convenience init( navigator: Navigator) {
        self.init()
        self.navigator = navigator
    }
    
    func setPresenter(_ presenter: PresenterType) {
        self.presenter = presenter as? HomePresenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.makeUI()
    }
    
    private func makeUI() {
        
    }
}

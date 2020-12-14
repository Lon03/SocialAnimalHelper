//
//  HomeTabBarController.swift
//  AnimalHelper
//
//  Created by Mike Martyniuk on 11/30/19.
//  Copyright © 2019 animalHelper. All rights reserved.
//

import UIKit
import RAMAnimatedTabBarController

enum HomeTabBarItem: Int {
    case news, location, create, notifications, user
    
    private func controller(with provider: SwiftHubAPI, navigator: Navigator) -> UIViewController {
        switch self {
        case .news:
            
            let cv = SettingsController(navigator: navigator)
            let presenter = SettingsPresenter(view: cv, provider: provider)
            cv.setPresenter(presenter)
            return NavigationController(rootViewController: cv)
            
        case .location:
            
            let cv = SettingsController(navigator: navigator)
            let presenter = SettingsPresenter(view: cv, provider: provider)
            cv.setPresenter(presenter)
            return NavigationController(rootViewController: cv)
            
        case .create:
            
            let cv = SettingsController(navigator: navigator)
            let presenter = SettingsPresenter(view: cv, provider: provider)
            cv.setPresenter(presenter)
            return NavigationController(rootViewController: cv)
            
        case .notifications:
            
            let cv = SettingsController(navigator: navigator)
            let presenter = SettingsPresenter(view: cv, provider: provider)
            cv.setPresenter(presenter)
            return NavigationController(rootViewController: cv)
            
        case .user:
            
            let cv = SettingsController(navigator: navigator)
            let presenter = SettingsPresenter(view: cv, provider: provider)
            cv.setPresenter(presenter)
            return NavigationController(rootViewController: cv)
            
        }
    }
    
    private var image: UIImage? {
        switch self {
        case .news: return #imageLiteral(resourceName: "Home")
        case .location: return #imageLiteral(resourceName: "Inactive")
        case .create: return #imageLiteral(resourceName: "Inactive-1")
        case .notifications: return #imageLiteral(resourceName: "Inactive-2")
        case .user: return #imageLiteral(resourceName: "Inactive-3")
        }
    }
    
    private var title: String? {
        switch self {
        case .news: return nil
        case .location: return nil
        case .create: return nil
        case .notifications: return nil
        case .user: return nil
        }
    }
    
    private var animation: RAMItemAnimation {
        var animation: RAMItemAnimation
        switch self {
        case .news: animation = RAMFlipLeftTransitionItemAnimations()
        case .location: animation = RAMBounceAnimation()
        case .create: animation = RAMBounceAnimation()
        case .notifications: animation = RAMRightRotationAnimation()
        case .user: animation = RAMBounceAnimation()
        }
        
        switch self {
        case .news: animation.iconSelectedColor = .black
        case .location: animation.iconSelectedColor = .black
        case .create: animation.iconSelectedColor = .black
        case .notifications: animation.iconSelectedColor = nil
        case .user: break
        }
        return animation
    }
    
    func getController(with provider: SwiftHubAPI, navigator: Navigator) -> UIViewController {
        let vc = controller(with: provider, navigator: navigator)
        let item = RAMAnimatedTabBarItem(title: title, image: image, tag: rawValue)
        item.animation = animation
        switch self {
        case .news: item.iconColor = .gray
        case .location: item.iconColor = .gray
        case .create: item.iconColor = .gray
        case .notifications: item.iconColor = .gray
        case .user: break
        }
        vc.tabBarItem = item
        return vc
    }
}

extension HomeTabBarController: HomeTabBarInterface {}

class HomeTabBarController: RAMAnimatedTabBarController, Navigatable, UITabBarControllerDelegate {
    
    private var presenter: HomeTabBarPresenter?
    var navigator: Navigator!
    
    init(navigator: Navigator) {
        self.navigator = navigator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Public methods

    func setPresenter(_ presenter: PresenterType) {
        self.presenter = presenter as? HomeTabBarPresenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.makeUI()
        self.bind()
        self.delegate = self

    }

    private func makeUI() {
        // Configure tab bar
        self.hero.isEnabled = true
//        tabBar.hero.id = "TabBarID"
        self.tabBar.isTranslucent = true
        
    }
    
    private func bind() {
        guard let presenter = self.presenter else { return }
        let controllers = presenter.transform().map { $0.getController(with: presenter.provider, navigator: self.navigator) }
        self.setViewControllers(controllers, animated: false)
    }
}

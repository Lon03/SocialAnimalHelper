//
//  Navigator.swift
//  AnimalHelper
//
//  Created by Mike Martyniuk on 11/30/19.
//  Copyright © 2019 animalHelper. All rights reserved.
//

import Foundation
import UIKit
import SafariServices
import Hero
import AcknowList
import MessageUI

protocol Navigatable: class {
    var navigator: Navigator! { get set }
}

class Navigator {
    static var `default` = Navigator()
    
    // MARK: - segues list, all app scenes
    enum Scene {
        case tabs(provider: SwiftHubAPI)
        case root(provider: SwiftHubAPI)
        case registration(provider: SwiftHubAPI)
        case login(provider: SwiftHubAPI)
        case home(provider: SwiftHubAPI)

        case safari(URL)
        case safariController(URL)
//        case webController(URL)
    }
    
    enum Transition {
        case root(in: UIWindow)
        case rootLogin
        case navigation(type: HeroDefaultAnimationType)
        case customModal(type: HeroDefaultAnimationType)
        case modal
        case detail
        case alert
        case custom
    }
    
    // MARK: - get a single VC
    func get(segue: Scene) -> UIViewController? {
        switch segue {
        case let .tabs(provider):
            let cv = HomeTabBarController(navigator: self)
            let presenter = HomeTabBarPresenter(view: cv, provider: provider)
            cv.setPresenter(presenter)
            return cv
            
        case let .root(provider):
            let cv = InitialViewController(navigator: self)
            let presenter = InitialPresenter(view: cv, provider: provider)
            cv.setPresenter(presenter)
            return cv
            
        case let .registration(provider):
            let cv = RegistrationController(navigator: self)
            let presenter = RegistrationPresenter(view: cv, provider: provider)
            cv.setPresenter(presenter)
            return cv
            
        case let .login(provider):
            
            let cv = LoginController(navigator: self)
            let presenter = LoginPresenter(view: cv, provider: provider)
            cv.setPresenter(presenter)
            return cv
          
        case let .home(provider):
            
            let cv = HomeController(navigator: self)
            let presenter = HomePresenter(view: cv, provider: provider)
            cv.setPresenter(presenter)
            return cv
            
        case .safari(let url):
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
            return nil
            
        case .safariController(let url):
            let vc = SFSafariViewController(url: url)
            return vc
            
//        case .webController(let url):
//            let vc = WebViewController(viewModel: nil, navigator: self)
//            vc.load(url: url)
//            return vc
        }
    }
    
    func pop(sender: UIViewController?, toRoot: Bool = false) {
        if toRoot {
            sender?.navigationController?.popToRootViewController(animated: true)
        } else {
            sender?.navigationController?.popViewController(animated: true)
        }
    }
    
    func dismissNavigation(sender: UIViewController?) {
        sender?.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    func dismiss(sender: UIViewController?) {
        sender?.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - invoke a single segue
    func show(segue: Scene, sender: UIViewController?, transition: Transition = .navigation(type: .cover(direction: .left))) {
        if let target = get(segue: segue) {
            show(target: target, sender: sender, transition: transition)
        }
    }
    
    private func show(target: UIViewController, sender: UIViewController?, transition: Transition) {
        switch transition {
        case .root(in: let window):
            UIView.transition(with: window, duration: 0.5, options: .transitionFlipFromLeft, animations: {
                window.rootViewController = target
            }, completion: nil)
            return
        case .rootLogin:
//            self.window.rootViewController = target
            return
        default: break
        }
        
        guard let sender = sender else {
            fatalError("You need to pass in a sender for .navigation or .modal transitions")
        }
        
        if let nav = sender as? UINavigationController {
            //push root controller on navigation stack
            nav.pushViewController(target, animated: false)
            return
        }
        
        switch transition {
        case .navigation(let type):
            if let nav = sender.navigationController {
                // push controller to navigation stack
                nav.hero.navigationAnimationType = .autoReverse(presenting: type)
                nav.pushViewController(target, animated: true)
            }
        case .customModal(let type):
            // present modally with custom animation
            DispatchQueue.main.async {
                let nav = NavigationController(rootViewController: target)
                nav.hero.modalAnimationType = .autoReverse(presenting: type)
                sender.present(nav, animated: true, completion: nil)
            }
        case .modal:
            // present modally
            DispatchQueue.main.async {
                let nav = NavigationController(rootViewController: target)
                sender.present(nav, animated: true, completion: nil)
            }
        case .detail:
            DispatchQueue.main.async {
                let nav = NavigationController(rootViewController: target)
                sender.showDetailViewController(nav, sender: nil)
            }
        case .alert:
            DispatchQueue.main.async {
                sender.present(target, animated: true, completion: nil)
            }
        default: break
        }
    }
    
    func toInviteContact(withPhone phone: String) -> MFMessageComposeViewController {
        let vc = MFMessageComposeViewController()
        vc.body = "---"
        vc.recipients = [phone]
        return vc
    }
    
    func open(cv: UIViewController, sender: UIViewController?) {
    }
}

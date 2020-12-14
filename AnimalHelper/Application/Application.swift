//
//  Application.swift
//  AnimalHelper
//
//  Created by Mike Martyniuk on 11/30/19.
//  Copyright © 2019 animalHelper. All rights reserved.
//

import UIKit

final class Application: NSObject {
    static let shared = Application()
    
    var window: UIWindow?
    
    var provider: SwiftHubAPI?
    let authManager: AuthManager
    let navigator: Navigator
    
    private override init() {
        authManager = AuthManager.shared
        navigator = Navigator.default
        super.init()
        updateProvider()
    }
    
    private func updateProvider() {
        if let token = authManager.token, Configs.Network.useStaging == false {
            switch token.type() {
            case .oAuth(let token):
                provider = GraphApi(token: token)
            case .basic(let token):
                provider = GraphApi(token: token)
            case .unauthorized:
                provider = GraphApi(token: nil)
            }
        } else {
             provider = GraphApi(token: nil)
        }
       
    }
    
    func presentInitialScreen(in window: UIWindow?) {
        updateProvider()
        guard let window = window, let provider = provider else { return }
        self.window = window

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            guard let user = User.currentUser(),
                  let email = user.email
                else {
                    self.presentInitial(provider: provider, in: window)
                    return
            }
            //                analytics.identify(userId: login)
            //                analytics.updateUser(name: user.name ?? "", email: user.email ?? "")
            provider.user(email: email, handler: {(err, data) in
                guard let _ = data else {
                    self.presentInitial(provider: provider, in: window)
                    return
                }
                self.presentHome(provider: provider, in: window)
            })
        }
    }
    
    private func presentInitial(provider: SwiftHubAPI, in window: UIWindow) {
        self.navigator.show(segue: .root(provider: provider), sender: nil, transition: .root(in: window))
    }
    
    private func presentHome(provider: SwiftHubAPI, in window: UIWindow) {
        self.navigator.show(segue: .tabs(provider: provider), sender: nil, transition: .root(in: window))
    }
    
    func presentTestScreen(in window: UIWindow?) {
    }
}

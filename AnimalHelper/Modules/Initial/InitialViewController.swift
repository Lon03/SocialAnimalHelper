//
//  InitialViewController.swift
//  AnimalHelper
//
//  Created by Mike Martyniuk on 11/30/19.
//  Copyright © 2019 animalHelper. All rights reserved.
//

import UIKit
import Apollo
import AuthenticationServices

extension InitialViewController: InitialViewInterface {

    func activityIndicatorChange(_ state: Bool) {
        if state {
            self.activityIndicatorView.startAnimating()
        } else {
            self.activityIndicatorView.stopAnimating()
        }
    }
}

class InitialViewController: UIViewControllerCustom, Navigatable {
    

    private var presenter: InitialPresenter?
    var navigator: Navigator!
    
    @IBOutlet weak var loginBtn: UIButton! {
        willSet {
            newValue.setTitleColor(.primary(), for: .normal)
        }
    }
    
    @IBOutlet weak var loginBtnApple: ASAuthorizationAppleIDButton! {
        willSet {
            newValue.layer.cornerRadius = 28
            newValue.backgroundColor = .primary()
        }
    }
    @IBOutlet weak var registerBtn: BorderButton!

    
    convenience init(navigator: Navigator) {
        self.init()
        self.navigator = navigator
    }

    // MARK: Public methods

    func setPresenter(_ presenter: PresenterType) {
        self.presenter = presenter as? InitialPresenter

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.makeUI()
    }
    
    private func makeUI() {

    }
    
    @IBAction func registerBtn(_ sender: BorderButton) {
        print("registerBtn")
        guard let presenter = presenter else { return }

        self.navigator.show(segue: .registration(provider: presenter.provider), sender: self, transition: .alert)
    }
    
    @IBAction func loginBtnApple(_ sender: ASAuthorizationAppleIDButton) {
        let provider = ASAuthorizationAppleIDProvider()
        let request = provider.createRequest()
        request.requestedScopes = [.email]
        let controller = ASAuthorizationController(authorizationRequests: [request])
        
        controller.delegate = self
        controller.presentationContextProvider = self
        
        controller.performRequests()
    }
    
    @IBAction func loginBtn(_ sender: UIButton) {
        guard let presenter = self.presenter else { return }
                
        self.navigator.show(segue: .login(provider: presenter.provider), sender: self, transition: .alert)
    }

}

@available(iOS 13.0, *)
extension InitialViewController: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        
        switch authorization.credential {
            
        case let credentials as ASAuthorizationAppleIDCredential:
            print("email: \(credentials.email)")
            print("identityToken: \(credentials.identityToken)")
            print("authorizationCode: \(credentials.authorizationCode?.base64EncodedString())")
            print("realUserStatus: \(credentials.user)")
            print("state: \(credentials.state)")

            break
            
        default: break
            
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("something bad happened", error)
    }
}

@available(iOS 13.0, *)
extension InitialViewController: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        
        return view.window!

    }
    
    
}



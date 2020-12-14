//
//  RegistrationPresenter.swift
//  AnimalHelper
//
//  Created by Mike Martyniuk on 14.12.2020.
//  Copyright © 2020 animalHelper. All rights reserved.
//

import Foundation
import UIKit

class RegistrationPresenter: PresenterType {
    
    // MARK: Public properties
    
    private weak var view: RegistrationViewInterface!
    
    private var dataRegistrationField: [RegistrationTypeField] = [
        .nickname(title: "Никнейм"),
        .email(title: "Email"),
        .phone(title: "Номер телефона"),
        .password(title: "Пароль")
    ]
   private var registrationData: UserRegistrationFields =
        UserRegistrationFields.init()
    
    
    // MARK: Public methods
    
    init(view: RegistrationViewInterface, provider: SwiftHubAPI) {
        self.view = view
        super.init(provider: provider)
    }
    

    
    private func registerUser(handler: @escaping ((Error?, User?)->Void)) {
        guard
            let username = self.registrationData.username,
            let email = self.registrationData.email,
            let password = self.registrationData.password,
            let phone = self.registrationData.phone
            else {
                handler(nil, nil)
                return
        }
        self.provider.register(
            username: username,
            email: email,
            password: password,
            phone: phone,
            handler: { (err, data) in
                guard let value = data else {
                    handler(err, nil)
                    return
                }
                let user = User(graph: value.data)
                handler(nil, user)
        })
    }
    
    private func loginUser(
        username: String?,
        email: String?,
        handler: @escaping ((Error?, User?)->Void)) {
        guard
            let password = self.registrationData.password
            else {
                handler(nil, nil)
                return
        }
        self.provider.login(
            username: username,
            email: email,
            password: password,
            handler: { (err, data) in
                guard
                    let value = data,
                    let token = value.data?.login.token
                    else {
                        handler(err, nil)
                        return
                }
                let user = User(graph: value.data)
                AuthManager.setToken(token: Token(basicToken: token))
                user.save()
                handler(err, user)
        })
    }
    
    private func setTextField(dataType: RegistrationTypeField, text: String?, handler: @escaping ((UserRegistrationFields)->Void)) {
        switch dataType {
        case .nickname:
            self.registrationData.username = text
        case .email:
            self.registrationData.email = text
        case .phone:
            self.registrationData.phone = text
        case .password:
            self.registrationData.password = text
        }
        handler(self.registrationData)
    }
    
    private func checkValidFields() -> Bool {
        guard
            (self.registrationData.email != nil),
            (self.registrationData.username != nil),
            (self.registrationData.phone != nil),
            (self.registrationData.password != nil)
            else {
            return false
        }
        return true
    }
}

extension RegistrationPresenter: RegistrationPresentation {

    func register() {
        self.view.activityIndicatorChange(true)
        self.registerUser(handler: { (err, data) in
            guard let _ = data else {
                self.view.activityIndicatorChange(false)
                Alert.shared.showErrorAler(title: "Ошибка", desc: err?.localizedDescription ?? "", textColor: .white)
                return
            }
            self.view.activityIndicatorChange(false)
            Application.shared.presentInitialScreen(in: Application.shared.window)
        })
        
        self.registerUser(handler: { (err, data) in
            guard let user = data else {
                self.view.activityIndicatorChange(false)
                Alert.shared.showErrorAler(title: "Ошибка", desc: err?.localizedDescription ?? "", textColor: .white)
                return
            }

            self.loginUser(
                username: user.username,
                email: user.email, handler: { (err, data) in
                    self.view.activityIndicatorChange(false)
                    guard let _ = data else {
                        Alert.shared.showErrorAler(title: "Ошибка", desc: err?.localizedDescription ?? "", textColor: .white)
                        return
                    }
                    Application.shared.presentInitialScreen(in: Application.shared.window)
            })
        })
        
    }
    func onViewDidLoad() {
    }
    
    func textFieldChange(dataType: RegistrationTypeField, text: String?){
        self.setTextField(dataType: dataType, text: text, handler: { _ in
            self.view.initSaveButtonState(state: self.checkValidFields())
        })
    }
    
    func getFields() -> UserRegistrationFields {
        return registrationData
    }
    
    func getData() ->[RegistrationTypeField]{
        return self.dataRegistrationField
    }
}

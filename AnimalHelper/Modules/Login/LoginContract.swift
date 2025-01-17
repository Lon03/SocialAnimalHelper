//
//  LoginContract.swift
//  AnimalHelper
//
//  Created by Mike Martyniuk on 14.12.2020.
//  Copyright © 2020 animalHelper. All rights reserved.
//

import UIKit

protocol LoginViewInterface: class {
    func reloadProfile()
    func activityIndicatorChange(_ state: Bool)
    func initSaveButtonState(state: Bool)
}

protocol LoginPresentation: class {
    func onViewDidLoad()
    func getData() ->[RegistrationTypeField]
    func textFieldChange(dataType: RegistrationTypeField, text: String?)
    func getFields() -> UserRegistrationFields
    func login()
}

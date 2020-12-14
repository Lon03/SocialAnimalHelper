//
//  Registration.swift
//  AnimalHelper
//
//  Created by Mike Martyniuk on 12/1/19.
//  Copyright © 2019 animalHelper. All rights reserved.
//

import Foundation

enum RegistrationTypeField {
    case nickname(title: String)
    case email(title: String)
    case phone(title: String)
    case password(title: String)

//    var description: String {
//        switch self {
//        case .nickname: return "basic"
//        case .oAuth: return "OAuth"
//        case .unauthorized: return "unauthorized"
//        }
//    }
}

enum LoginTypeField {
    case nickname(title: String)
    case password(title: String)
}

//
//  AuthManager.swift
//  AnimalHelper
//
//  Created by Mike Martyniuk on 11/29/19.
//  Copyright © 2019 animalHelper. All rights reserved.
//

import Foundation
import KeychainAccess
import ObjectMapper

var loggedIn: Bool = false

class AuthManager {
    
    /// The default singleton instance.
    static let shared = AuthManager()
    
    // MARK: - Properties
    fileprivate let tokenKey = "TokenKey"
    fileprivate let keychain = Keychain(service: Configs.App.bundleIdentifier)
    
    var tokenChanged: Token?
    
    init() {
        loggedIn = hasValidToken
    }
    
    var token: Token? {
        get {
            guard let jsonString = keychain[tokenKey] else { return nil }
            return Mapper<Token>().map(JSONString: jsonString)
        }
        set {
            if let token = newValue, let jsonString = token.toJSONString() {
                keychain[tokenKey] = jsonString
            } else {
                keychain[tokenKey] = nil
            }
            tokenChanged = newValue
            loggedIn = hasValidToken
        }
    }
    
    var hasValidToken: Bool {
        return token?.isValid == true
    }
    
    class func setToken(token: Token) {
        AuthManager.shared.token = token
    }
    
    class func removeToken() {
        AuthManager.shared.token = nil
    }
    
    class func tokenValidated() {
        AuthManager.shared.token?.isValid = true
    }
}

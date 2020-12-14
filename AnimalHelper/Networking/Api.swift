//
//  Api.swift
//  AnimalHelper
//
//  Created by Mike Martyniuk on 11/28/19.
//  Copyright © 2019 animalHelper. All rights reserved.
//

import Foundation
import Apollo

protocol SwiftHubAPI {
    func user(email: String, handler: @escaping ((Error?, GraphQLResult<UserQuery.Data>?)->Void))
    
    func register(
        username: String,
        email: String,
        password: String,
        phone: String,
        handler: @escaping ((Error?, GraphQLResult<CreateUserMutation.Data>?)->Void))
    
    func login(
        username: String?,
        email: String?,
        password: String,
        handler: @escaping ((Error?, GraphQLResult<LoginQueryQuery.Data>?)->Void))
}

//
//  GraphApi.swift
//  AnimalHelper
//
//  Created by Mike Martyniuk on 11/28/19.
//  Copyright © 2019 animalHelper. All rights reserved.
//

import Foundation
import Apollo
import ObjectMapper


class GraphApi: SwiftHubAPI {
    
    let token: String?
    
    private lazy var networkTransport = HTTPNetworkTransport(
        url: URL(string: "http://192.168.0.102:3000/graphql")!,
        delegate: self
    )
    
    private(set) lazy var client = ApolloClient(networkTransport: self.networkTransport)
    
    init(token: String?) {
        self.token = token
    }
}

extension GraphApi: HTTPNetworkTransportPreflightDelegate {
    func networkTransport(_ networkTransport: HTTPNetworkTransport, shouldSend request: URLRequest) -> Bool {
        return true
    }
    
    func networkTransport(_ networkTransport: HTTPNetworkTransport, willSend request: inout URLRequest) {
        guard let tokenString = self.token else {
            return
        }
        var headers = request.allHTTPHeaderFields ?? [String: String]()
        print("tokentoken: \(tokenString)")
        headers["Authorization"] = "Bearer \(tokenString)"
        request.allHTTPHeaderFields = headers
    }
}

extension GraphApi {
    
    func user(email: String, handler: @escaping ((Error?, GraphQLResult<UserQuery.Data>?)->Void)) {
        client.fetch(query: UserQuery(email: email), queue: .global(qos: .userInitiated)) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    guard let error = data.errors else {
                        handler(nil, data)
                        return
                    }
                    handler(error.first, nil)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    handler(error, nil)
                }
            }
        }
    }
    
    func register(username: String,
                  email: String,
                  password: String,
                  phone: String,
                  handler: @escaping ((Error?, GraphQLResult<CreateUserMutation.Data>?)->Void)) {
        client.perform(
            mutation: CreateUserMutation(
                createUserInput:
                    CreateUserInput(
                        username: username,
                        email: email,
                        password: password,
                        phone: phone
                    )),
            queue: .global(qos: .userInitiated)) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    
                    guard let error = data.errors else {
                        handler(nil, data)
                        return
                    }
                    handler(error.first, nil)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    
                    handler(error, nil)
                }
            }
        }
    }
    
    func login(
        username: String?,
        email: String?,
        password: String,
        handler: @escaping ((Error?, GraphQLResult<LoginQueryQuery.Data>?)->Void)) {
        client.fetch(
            query: LoginQueryQuery(
                loginUser:
                    LoginUserInput(
                        username: username,
                        email: email,
                        password: password
                    ))) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    guard let error = data.errors else {
                        handler(nil, data)
                        return
                    }
                    handler(error.first, nil)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    handler(error, nil)
                }
            }
        }
    }
}

extension GraphApi {
    private func ownerName(from fullname: String) -> String {
        return fullname.components(separatedBy: "/").first ?? ""
    }
    
    private func repoName(from fullname: String) -> String {
        return fullname.components(separatedBy: "/").last ?? ""
    }
}

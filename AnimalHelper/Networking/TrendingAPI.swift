//
//  TrendingGithubAPI.swift
//  AnimalHelper
//
//  Created by Mike Martyniuk on 11/28/19.
//  Copyright © 2019 animalHelper. All rights reserved.
//

import Foundation

enum TrendingAPI {
    case users
}

extension TrendingAPI {
    
//    var baseURL: URL {
//        return Configs.Network.trendingGithubBaseUrl.url!
//    }
    
    var path: String {
        switch self {
        case .users: return "/users"
        }
    }
    
    var headers: [String: String]? {
        return nil
    }
    
    var parameters: [String: Any]? {
        var params: [String: Any] = [:]
        switch self {
        case .users:
            params["users"] = "users"
        }
        return params
    }
    
//    public var parameterEncoding: ParameterEncoding {
//        return URLEncoding.default
//    }
}

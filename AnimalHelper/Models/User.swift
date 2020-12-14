//
//  User.swift
//  AnimalHelper
//
//  Created by Mike Martyniuk on 12/1/19.
//  Copyright © 2019 animalHelper. All rights reserved.
//


import Foundation
import KeychainAccess
import ObjectMapper

private let userKey = "CurrentUserKey"
private let keychain = Keychain(service: Configs.App.bundleIdentifier)

enum UserType: String {
    case user = "User"
    case organization = "Organization"
}

/// User model
struct User: Mappable {
    var email: String?  // The user's publicly visible profile email.
    var username: String?  // The username used to login.
    var token: String?


    
    var avatarUrl: String?  // A URL pointing to the user's public avatar.
    var blog: String?  // A URL pointing to the user's public website/blog.
    var company: String?  // The user's public profile company.
    var contributions: Int?
    var createdAt: Date?  // Identifies the date and time when the object was created.
    var followers: Int?  // Identifies the total count of followers.
    var following: Int? // Identifies the total count of following.
    var htmlUrl: String?  // The HTTP URL for this user
    var location: String?  // The user's public profile location.
    var name: String?  // The user's public profile name.
    var type: UserType = .user
    var updatedAt: Date?  // Identifies the date and time when the object was last updated.
    var starredRepositoriesCount: Int?  // Identifies the total count of repositories the user has starred.
    var repositoriesCount: Int?  // Identifies the total count of repositories that the user owns.
    var issuesCount: Int?  // Identifies the total count of issues associated with this user
    var watchingCount: Int?  // Identifies the total count of repositories the given user is watching
    var viewerCanFollow: Bool?  // Whether or not the viewer is able to follow the user.
    var viewerIsFollowing: Bool?  // Whether or not this user is followed by the viewer.
    var isViewer: Bool?  // Whether or not this user is the viewing user.
    var organizations: [User]?  // A list of organizations the user belongs to.
    
    // Only for Organization type
    var descriptionField: String?
    
    // Only for User type
    var bio: String?  // The user's public profile bio.
    
    // SenderType
//    var senderId: String { return login ?? "" }
//    var displayName: String { return login ?? "" }
    
    init?(map: Map) {}
    init() {}
    
    init(email: String?, username: String?, token: String?) {
        self.email = email
        self.username = username
        self.token = token
    }
    
    mutating func mapping(map: Map) {
        avatarUrl <- map["avatar_url"]
        blog <- map["blog"]
        company <- map["company"]
        contributions <- map["contributions"]
        createdAt <- (map["created_at"], ISO8601DateTransform())
        descriptionField <- map["description"]
        email <- map["email"]
        followers <- map["followers"]
        following <- map["following"]
        htmlUrl <- map["html_url"]
        location <- map["location"]
//        login <- map["login"]
        name <- map["name"]
        repositoriesCount <- map["public_repos"]
        type <- map["type"]
        updatedAt <- (map["updated_at"], ISO8601DateTransform())
        bio <- map["bio"]
    }
}

struct UserRegistrationFields {
    var username: String?
    var email: String?
    var phone: String?
    var password: String?
    init(
        username: String? = nil,
        email: String? = nil,
        phone: String? = nil,
        password: String? = nil
        ) {
        self.username = username
        self.email = email
        self.phone = phone
        self.password = password
    }
}
/// GraphQL initializators for User model
extension User {
    
    init(graph: CreateUserMutation.Data?) {
        self.init(email: graph?.createUser.email, username: graph?.createUser.username, token: nil)
    }
    
    init(graph: LoginQueryQuery.Data?) {
        self.init(email: graph?.login.user.email, username: graph?.login.user.username, token: graph?.login.token)
    }
}

extension User {
    func isMine() -> Bool {
        if let isViewer = isViewer {
            return isViewer
        }
        return self == User.currentUser()
    }
    
    func save() {
        if let json = self.toJSONString() {
            keychain[userKey] = json
        } else {
//            logError("User can't be saved")
        }
    }
    
    static func currentUser() -> User? {
        if let json = keychain[userKey], let user = User(JSONString: json) {
            return user
        }
        return nil
    }
    
    static func removeCurrentUser() {
        keychain[userKey] = nil
    }
}

extension User: Equatable {
//    static func == (lhs: User, rhs: User) -> Bool {
//        return lhs.login == rhs.login
//    }
}

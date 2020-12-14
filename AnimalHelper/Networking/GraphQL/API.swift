//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public struct LoginUserInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(username: Swift.Optional<String?> = nil, email: Swift.Optional<String?> = nil, password: String) {
    graphQLMap = ["username": username, "email": email, "password": password]
  }

  public var username: Swift.Optional<String?> {
    get {
      return graphQLMap["username"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "username")
    }
  }

  public var email: Swift.Optional<String?> {
    get {
      return graphQLMap["email"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "email")
    }
  }

  public var password: String {
    get {
      return graphQLMap["password"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "password")
    }
  }
}

public struct CreateUserInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(username: String, email: String, password: String, phone: String) {
    graphQLMap = ["username": username, "email": email, "password": password, "phone": phone]
  }

  public var username: String {
    get {
      return graphQLMap["username"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "username")
    }
  }

  public var email: String {
    get {
      return graphQLMap["email"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "email")
    }
  }

  public var password: String {
    get {
      return graphQLMap["password"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "password")
    }
  }

  public var phone: String {
    get {
      return graphQLMap["phone"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "phone")
    }
  }
}

public final class LoginQueryQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query loginQuery($loginUser: LoginUserInput!) {
      login(user: $loginUser) {
        __typename
        token
        user {
          __typename
          username
          email
        }
      }
    }
    """

  public let operationName = "loginQuery"

  public var loginUser: LoginUserInput

  public init(loginUser: LoginUserInput) {
    self.loginUser = loginUser
  }

  public var variables: GraphQLMap? {
    return ["loginUser": loginUser]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("login", arguments: ["user": GraphQLVariable("loginUser")], type: .nonNull(.object(Login.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(login: Login) {
      self.init(unsafeResultMap: ["__typename": "Query", "login": login.resultMap])
    }

    public var login: Login {
      get {
        return Login(unsafeResultMap: resultMap["login"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "login")
      }
    }

    public struct Login: GraphQLSelectionSet {
      public static let possibleTypes = ["LoginResult"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("token", type: .nonNull(.scalar(String.self))),
        GraphQLField("user", type: .nonNull(.object(User.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(token: String, user: User) {
        self.init(unsafeResultMap: ["__typename": "LoginResult", "token": token, "user": user.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var token: String {
        get {
          return resultMap["token"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "token")
        }
      }

      public var user: User {
        get {
          return User(unsafeResultMap: resultMap["user"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "user")
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("username", type: .nonNull(.scalar(String.self))),
          GraphQLField("email", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(username: String, email: String) {
          self.init(unsafeResultMap: ["__typename": "User", "username": username, "email": email])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var username: String {
          get {
            return resultMap["username"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "username")
          }
        }

        public var email: String {
          get {
            return resultMap["email"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "email")
          }
        }
      }
    }
  }
}

public final class CreateUserMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    mutation CreateUser($createUserInput: CreateUserInput!) {
      createUser(createUserInput: $createUserInput) {
        __typename
        username
        email
      }
    }
    """

  public let operationName = "CreateUser"

  public var createUserInput: CreateUserInput

  public init(createUserInput: CreateUserInput) {
    self.createUserInput = createUserInput
  }

  public var variables: GraphQLMap? {
    return ["createUserInput": createUserInput]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createUser", arguments: ["createUserInput": GraphQLVariable("createUserInput")], type: .nonNull(.object(CreateUser.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createUser: CreateUser) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createUser": createUser.resultMap])
    }

    public var createUser: CreateUser {
      get {
        return CreateUser(unsafeResultMap: resultMap["createUser"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "createUser")
      }
    }

    public struct CreateUser: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("username", type: .nonNull(.scalar(String.self))),
        GraphQLField("email", type: .nonNull(.scalar(String.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(username: String, email: String) {
        self.init(unsafeResultMap: ["__typename": "User", "username": username, "email": email])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var username: String {
        get {
          return resultMap["username"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "username")
        }
      }

      public var email: String {
        get {
          return resultMap["email"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "email")
        }
      }
    }
  }
}

public final class RefreshTokenQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query refreshToken {
      refreshToken
    }
    """

  public let operationName = "refreshToken"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("refreshToken", type: .nonNull(.scalar(String.self))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(refreshToken: String) {
      self.init(unsafeResultMap: ["__typename": "Query", "refreshToken": refreshToken])
    }

    public var refreshToken: String {
      get {
        return resultMap["refreshToken"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "refreshToken")
      }
    }
  }
}

public final class UsersQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query users {
      users {
        __typename
        username
        email
      }
    }
    """

  public let operationName = "users"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("users", type: .nonNull(.list(.nonNull(.object(User.selections))))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(users: [User]) {
      self.init(unsafeResultMap: ["__typename": "Query", "users": users.map { (value: User) -> ResultMap in value.resultMap }])
    }

    public var users: [User] {
      get {
        return (resultMap["users"] as! [ResultMap]).map { (value: ResultMap) -> User in User(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: User) -> ResultMap in value.resultMap }, forKey: "users")
      }
    }

    public struct User: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("username", type: .nonNull(.scalar(String.self))),
        GraphQLField("email", type: .nonNull(.scalar(String.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(username: String, email: String) {
        self.init(unsafeResultMap: ["__typename": "User", "username": username, "email": email])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var username: String {
        get {
          return resultMap["username"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "username")
        }
      }

      public var email: String {
        get {
          return resultMap["email"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "email")
        }
      }
    }
  }
}

public final class UserQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query user($email: String!) {
      user(email: $email) {
        __typename
        username
      }
    }
    """

  public let operationName = "user"

  public var email: String

  public init(email: String) {
    self.email = email
  }

  public var variables: GraphQLMap? {
    return ["email": email]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("user", arguments: ["email": GraphQLVariable("email")], type: .nonNull(.object(User.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(user: User) {
      self.init(unsafeResultMap: ["__typename": "Query", "user": user.resultMap])
    }

    public var user: User {
      get {
        return User(unsafeResultMap: resultMap["user"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "user")
      }
    }

    public struct User: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("username", type: .nonNull(.scalar(String.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(username: String) {
        self.init(unsafeResultMap: ["__typename": "User", "username": username])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var username: String {
        get {
          return resultMap["username"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "username")
        }
      }
    }
  }
}

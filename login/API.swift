// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public enum AuthState: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case authenticated
  case notAuthenticated
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "AUTHENTICATED": self = .authenticated
      case "NOT_AUTHENTICATED": self = .notAuthenticated
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .authenticated: return "AUTHENTICATED"
      case .notAuthenticated: return "NOT_AUTHENTICATED"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: AuthState, rhs: AuthState) -> Bool {
    switch (lhs, rhs) {
      case (.authenticated, .authenticated): return true
      case (.notAuthenticated, .notAuthenticated): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [AuthState] {
    return [
      .authenticated,
      .notAuthenticated,
    ]
  }
}

public final class LoginMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation Login($email: String!, $password: String!) {
      login(email: $email, password: $password) {
        __typename
        authState
        userUuid
        jwt
      }
    }
    """

  public let operationName: String = "Login"

  public var email: String
  public var password: String

  public init(email: String, password: String) {
    self.email = email
    self.password = password
  }

  public var variables: GraphQLMap? {
    return ["email": email, "password": password]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("login", arguments: ["email": GraphQLVariable("email"), "password": GraphQLVariable("password")], type: .nonNull(.object(Login.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(login: Login) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "login": login.resultMap])
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
      public static let possibleTypes: [String] = ["LoginResponse"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("authState", type: .scalar(AuthState.self)),
        GraphQLField("userUuid", type: .scalar(GraphQLID.self)),
        GraphQLField("jwt", type: .scalar(String.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(authState: AuthState? = nil, userUuid: GraphQLID? = nil, jwt: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "LoginResponse", "authState": authState, "userUuid": userUuid, "jwt": jwt])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var authState: AuthState? {
        get {
          return resultMap["authState"] as? AuthState
        }
        set {
          resultMap.updateValue(newValue, forKey: "authState")
        }
      }

      public var userUuid: GraphQLID? {
        get {
          return resultMap["userUuid"] as? GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "userUuid")
        }
      }

      public var jwt: String? {
        get {
          return resultMap["jwt"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "jwt")
        }
      }
    }
  }
}

// @generated
//  This file was automatically generated and should not be edited.
import Apollo
import Foundation

public final class GetUserByIdQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query getUserById($id: ID!) {
      getUserById(id: $id) {
        __typename
        firstName
      }
    }
    """

  public let operationName: String = "getUserById"

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getUserById", arguments: ["id": GraphQLVariable("id")], type: .object(GetUserById.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(getUserById: GetUserById? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "getUserById": getUserById.flatMap { (value: GetUserById) -> ResultMap in value.resultMap }])
    }

    public var getUserById: GetUserById? {
      get {
        return (resultMap["getUserById"] as? ResultMap).flatMap { GetUserById(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "getUserById")
      }
    }

    public struct GetUserById: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["UserResponse"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("firstName", type: .nonNull(.scalar(String.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(firstName: String) {
        self.init(unsafeResultMap: ["__typename": "UserResponse", "firstName": firstName])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var firstName: String {
        get {
          return resultMap["firstName"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "firstName")
        }
      }
    }
  }
}

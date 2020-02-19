//
//  Network.swift
//  login
//
//  Created by Kendall Motes on 2/18/20.
//  Copyright © 2020 Kendall Motes. All rights reserved.
//

import Foundation
import Apollo

class Network {
  static let shared = Network()

    
    private lazy var networkTransport: HTTPNetworkTransport = {
      let transport = HTTPNetworkTransport(url: URL(string: "http://localhost:8080/graphql")!)
      transport.delegate = self
      return transport
    }()
    
    
  private(set) lazy var apollo = ApolloClient(networkTransport: self.networkTransport)
}

extension Network: HTTPNetworkTransportPreflightDelegate {

  func networkTransport(_ networkTransport: HTTPNetworkTransport,
                          shouldSend request: URLRequest) -> Bool {
    // If there's an authenticated user, send the request. If not, don't.
    print("from networ1")
    return true
  }
  
  func networkTransport(_ networkTransport: HTTPNetworkTransport,
                        willSend request: inout URLRequest) {
                        print("from networ2")
    // Get the existing headers, or create new ones if they're nil
    var headers = request.allHTTPHeaderFields ?? [String: String]()

    // Add any new headers you need
    headers["Set-Cookie"] = "Bearer \(UserManager.shared.currentAuthToken)"
  
    // Re-assign the updated headers to the request.
    request.allHTTPHeaderFields = headers
    
    print( "Outgoing request: \(request)")
  }
}

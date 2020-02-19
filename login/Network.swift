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
    
  private(set) lazy var apollo = ApolloClient(url: URL(string: "http://localhost:8080/graphql")!)
}


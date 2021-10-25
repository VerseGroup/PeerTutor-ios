//
//  Messages.swift
//  PeerTutor
//
//  Created by Steven Yu on 10/25/21.
//

import Foundation
import Networking

// message after a user registers, returns a user object if successfully signs in
struct RegisterJSONMessage: Codable {
    let message: String
    let user: User?
}

extension RegisterJSONMessage: NetworkingJSONDecodable {}

// message after a user sends a learning/teaching request
struct RequestJSONMessage: Codable {
    let message: String
    let match_found: Bool
}

extension RequestJSONMessage: NetworkingJSONDecodable {}

// message after a user logs in, returns a user object if successfully signs in
struct LoginJSONMessage: Codable {
    let logged_in: Bool
    let user: User?
}

extension LoginJSONMessage: NetworkingJSONDecodable {}

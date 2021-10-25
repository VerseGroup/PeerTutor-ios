//
//  Match.swift
//  PeerTutor
//
//  Created by Steven Yu on 10/11/21.
//

import Foundation
import Networking

// gets all matches (for learning or teaching)
struct Matches: Codable {
    let matches: [Match]
}

extension Matches: NetworkingJSONDecodable {}

struct Match: Codable, Identifiable {
    let id: Int
    let tutor: User
    let tutee: User
    let course: Course
    let period: Period
}

extension Match: NetworkingJSONDecodable {}

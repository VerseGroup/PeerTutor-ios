//
//  CourseRequest.swift
//  PeerTutor
//
//  Created by Steven Yu on 10/11/21.
//

import Foundation
import Networking

// gets all match requests (for learning or teaching)
struct MatchRequests: Codable {
    let requests: [MatchRequest]
}

extension MatchRequests: NetworkingJSONDecodable {}

struct MatchRequest: Codable, Identifiable {
    let id: Int
    let user: User
    let course: Course
    let relationship: Bool // if relationship is true, then user is tutor, if relationship is false, user is tutee
}

extension MatchRequest: NetworkingJSONDecodable {}

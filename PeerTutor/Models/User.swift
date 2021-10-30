//
//  User.swift
//  PeerTutor
//
//  Created by Steven Yu on 10/11/21.
//

import Foundation
import Networking

struct User: Codable, Identifiable {
    let id: Int
    let username: String
    let email: String
    let permission: Int
    let grade: Int
    let joinDate: String
    let frees: [Period]
    
    let teachableGrades: [Int]
}

extension User: NetworkingJSONDecodable {}

enum Period: String, Codable {
    case d1p1, d1p2, d1p3, d1p4, d1p5, d1p6, d1p7
    case d2p1, d2p2, d2p3, d2p4, d2p5, d2p6, d2p7
    case d3p1, d3p2, d3p3, d3p4, d3p5, d3p6, d3p7
    case d4p1, d4p2, d4p3, d4p4, d4p5, d4p6, d4p7
    case d5p1, d5p2, d5p3, d5p4, d5p5, d5p6, d5p7
    case d6p1, d6p2, d6p3, d6p4, d6p5, d6p6, d6p7
    case d7p1, d7p2, d7p3, d7p4, d7p5, d7p6, d7p7
    
    var description: String {
        switch self {
        case .d1p1:
            return "Day 1 Period 1"
        case .d1p2:
            return "Day 1 Period 2"
        case .d1p3:
            return "Day 1 Period 3"
        case .d1p4:
            return "Day 1 Period 4"
        case .d1p5:
            return "Day 1 Period 5"
        case .d1p6:
            return "Day 1 Period 6"
        case .d1p7:
            return "Day 1 Period 7"
        case .d2p1:
            return "Day 2 Period 1"
        case .d2p2:
            return "Day 2 Period 2"
        case .d2p3:
            return "Day 2 Period 3"
        case .d2p4:
            return "Day 2 Period 4"
        case .d2p5:
            return "Day 2 Period 5"
        case .d2p6:
            return "Day 2 Period 6"
        case .d2p7:
            return "Day 2 Period 7"
        case .d3p1:
            return "Day 3 Period 1"
        case .d3p2:
            return "Day 3 Period 2"
        case .d3p3:
            return "Day 3 Period 3"
        case .d3p4:
            return "Day 3 Period 4"
        case .d3p5:
            return "Day 3 Period 5"
        case .d3p6:
            return "Day 3 Period 6"
        case .d3p7:
            return "Day 3 Period 7"
        case .d4p1:
            return "Day 4 Period 1"
        case .d4p2:
            return "Day 4 Period 2"
        case .d4p3:
            return "Day 4 Period 3"
        case .d4p4:
            return "Day 4 Period 4"
        case .d4p5:
            return "Day 4 Period 5"
        case .d4p6:
            return "Day 4 Period 6"
        case .d4p7:
            return "Day 4 Period 7"
        case .d5p1:
            return "Day 5 Period 1"
        case .d5p2:
            return "Day 5 Period 2"
        case .d5p3:
            return "Day 5 Period 3"
        case .d5p4:
            return "Day 5 Period 4"
        case .d5p5:
            return "Day 5 Period 5"
        case .d5p6:
            return "Day 5 Period 6"
        case .d5p7:
            return "Day 5 Period 7"
        case .d6p1:
            return "Day 6 Period 1"
        case .d6p2:
            return "Day 6 Period 2"
        case .d6p3:
            return "Day 6 Period 3"
        case .d6p4:
            return "Day 6 Period 4"
        case .d6p5:
            return "Day 6 Period 5"
        case .d6p6:
            return "Day 6 Period 6"
        case .d6p7:
            return "Day 6 Period 7"
        case .d7p1:
            return "Day 7 Period 1"
        case .d7p2:
            return "Day 7 Period 2"
        case .d7p3:
            return "Day 7 Period 3"
        case .d7p4:
            return "Day 7 Period 4"
        case .d7p5:
            return "Day 7 Period 5"
        case .d7p6:
            return "Day 7 Period 6"
        case .d7p7:
            return "Day 7 Period 7"
        }
    }
}

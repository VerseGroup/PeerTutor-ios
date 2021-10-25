//
//  Course.swift
//  PeerTutor
//
//  Created by Steven Yu on 10/11/21.
//

import Foundation
import Networking

// catalog of all courses
struct CourseCatalog: Codable {
    let courses: [Course]
}

extension CourseCatalog: NetworkingJSONDecodable {}

// individual course
struct Course: Codable, Identifiable {
    let id: Int
    let name: String
    let description: String
}

extension Course: NetworkingJSONDecodable {}

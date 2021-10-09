//
//  Models.swift
//  PeerTutor
//
//  Created by Steven Yu on 10/9/21.
//

import Foundation

// models - finished?

struct User: Codable, Identifiable {
    let id: Int
    let username: String
    let email: String
    let phone: Int
    let permission: Int
    let grade: Int
    let joinDate: Date
    
    let frees: [String]
    
    let teaches: [Match]
    let learns: [Match]
}

struct Course: Codable, Identifiable {
    let id: Int
    let name: String
    let description: String
}

struct Match: Codable, Identifiable {
    let id: Int
    let tutor: User
    let tutee: User
    let course: Course
    let period: String
}

//
//  User.swift
//  PeerTutor
//
//  Created by Steven Yu on 10/11/21.
//

import Foundation

struct User: Codable, Identifiable {
    let id: Int
    let username: String
    let email: String
    let permission: Int
    let grade: Int
    let joinDate: Date
    
    let gradeLevels: [Int]
    
    let frees: [Period]
}

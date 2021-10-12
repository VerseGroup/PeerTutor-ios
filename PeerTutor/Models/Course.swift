//
//  Course.swift
//  PeerTutor
//
//  Created by Steven Yu on 10/11/21.
//

import Foundation

struct Course: Codable, Identifiable {
    let id: Int
    let name: String
    let description: String
}

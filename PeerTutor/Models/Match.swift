//
//  Match.swift
//  PeerTutor
//
//  Created by Steven Yu on 10/11/21.
//

import Foundation

struct Match: Codable, Identifiable {
    let id: Int
    let tutor: User
    let tutee: User
    let course: Course
    let period: Period
}

//
//  CourseRequest.swift
//  PeerTutor
//
//  Created by Steven Yu on 10/11/21.
//

import Foundation

struct MatchRequest: Codable, Identifiable {
    let id: Int
    let user: User
    let course: Course
    let teaches: Bool // if teaches is true, then user is tutor, if teaches is false, user is tutee
}

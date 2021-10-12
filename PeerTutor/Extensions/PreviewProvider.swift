//
//  PreviewProvider.swift
//  PeerTutor
//
//  Created by Steven Yu on 10/11/21.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
    
}

class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    
    let homeVM = HomeViewModel()
    
    let user1: User
    let user2: User
    let user3: User
    
    let match1: Match
    let match2: Match
    
    let matchRequest1: MatchRequest
    let matchRequest2: MatchRequest
    
    let mathCourse = Course(id: 1, name: "AP Calculus AB/BC", description: "Do you enjoy having 2 hours of homework for a single class every night? If so, this course is the perfect course for you!")
    let englishCourse = Course(id: 2, name: "English 11", description: "Let's see if we can wheelspoke this...")
    let csCourse = Course(id: 3, name: "AP Computer Science A", description: "Learn how to become a living, breathing Java compiler in AP CSA")
    let chineseCourse = Course(id: 4, name: "AP Chinese", description: "你好吗")
    
    private init() {
        user1 = User(id: 1,
                     username: "PaulEvans",
                     email: "pevans@students.hackleyschool.org",
                     permission: 1,
                     grade: 11,
                     joinDate: Date(),
                     gradeLevels: [9, 10, 11, 12],
                     frees: [Period.d1p3, Period.d2p4, Period.d3p7, Period.d4p3, Period.d5p7, Period.d6p1, Period.d6p7, Period.d7p2])
        user2 = User(id: 2,
                     username: "MalcolmKrolick",
                     email: "mkrolick@students.hackleyschool.org",
                     permission: 1,
                     grade: 11,
                     joinDate: Date(),
                     gradeLevels: [9, 10, 11, 12],
                     frees: [Period.d1p7, Period.d7p3, Period.d3p7])
        user3 = User(id: 3,
                     username: "StevenYu",
                     email: "syu@students.hackleyschool.org",
                     permission: 1,
                     grade: 11,
                     joinDate: Date(),
                     gradeLevels: [9, 10, 11, 12],
                     frees: [Period.d1p3, Period.d3p7, Period.d4p3, Period.d5p7, Period.d6p1, Period.d6p7, Period.d7p2, Period.d7p3])
        
        match1 = Match(id: 1, tutor: user1, tutee: user2, course: csCourse, period: Period.d3p7)
        match2 = Match(id: 2, tutor: user3, tutee: user1, course: chineseCourse, period: Period.d7p3)
        
        matchRequest1 = MatchRequest(id: 1, user: user1, course: englishCourse, teaches: true)
        matchRequest2 = MatchRequest(id: 2, user: user2, course: englishCourse, teaches: false)
    }
}

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
    let authenticationVM = AuthenticationViewModel()
    let homeVM = HomeViewModel()
    
    let user1 = User(id: 1, username: "user1", email: "user1@gmail.com", permission: 1, grade: 10, joinDate: "lol", frees: [Period.d1p2, Period.d1p3], teachableGrades: [9,10,11,12])
    let user2 = User(id: 2, username: "user2", email: "user2@gmail.com", permission: 1, grade: 11, joinDate: "lol", frees: [Period.d1p2, Period.d1p3], teachableGrades: [9,10,11,12])
    
    let course1 = Course(id: 1, name: "Math", description: "I love math :)")
    
    let match1 = Match(id: 1, tutor: User(id: 1, username: "user1", email: "user1@gmail.com", permission: 1, grade: 10, joinDate: "lol", frees: [Period.d1p2, Period.d1p3], teachableGrades: [9,10,11,12]), tutee: User(id: 2, username: "user2", email: "user2@gmail.com", permission: 1, grade: 11, joinDate: "lol", frees: [Period.d1p2, Period.d1p3], teachableGrades: [9,10,11,12]), course: Course(id: 1, name: "Math", description: "I love math :)"), period: Period.d1p2)
}

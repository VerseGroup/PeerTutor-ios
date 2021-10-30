//
//  TeachingSessionDetailViewModel.swift
//  PeerTutor
//
//  Created by Steven Yu on 10/30/21.
//

import Foundation
import Combine

class TeachingSessionDetailViewModel: ObservableObject {
    @Published var match: Match
    
    @Published var course: Course
    @Published var tutee: User
    @Published var period: Period
    
    init(match: Match) {
        self.match = match
        self.course = match.course
        self.tutee = match.tutee
        self.period = match.period
    }
}

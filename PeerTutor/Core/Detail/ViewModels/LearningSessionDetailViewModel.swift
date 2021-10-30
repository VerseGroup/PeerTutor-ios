//
//  LearningSessionDetailViewModel.swift
//  PeerTutor
//
//  Created by Steven Yu on 10/30/21.
//

import Foundation
import Combine

class LearningSessionDetailViewModel: ObservableObject {
    @Published var match: Match
    
    @Published var course: Course
    @Published var tutor: User
    @Published var period: Period
    
    init(match: Match) {
        self.match = match
        self.course = match.course
        self.tutor = match.tutor
        self.period = match.period
    }
}

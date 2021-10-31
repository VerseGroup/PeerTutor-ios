//
//  TeachingRequestDetailViewModel.swift
//  PeerTutor
//
//  Created by Steven Yu on 10/30/21.
//

import Foundation
import Combine

class TeachingRequestDetailViewModel: ObservableObject {
    @Published var matchRequest: MatchRequest
    
    @Published var course: Course
    
    init(matchRequest: MatchRequest) {
        self.matchRequest = matchRequest
        self.course = matchRequest.course
    }
}

//
//  TeachingRequestViewModel.swift
//  PeerTutor
//
//  Created by Steven Yu on 10/30/21.
//

import Foundation
import Combine

class TeachingRequestViewModel: ObservableObject {
    var userManager: UserManager = UserManager.instance
    
    @Published var matchRequests: [MatchRequest] = []
    @Published var isLoading: Bool = false // set false for testing
    
    var cancellables = Set<AnyCancellable>()
    
    init() {
        getMatchRequests()
        addSubscribers()
    }
    
    func getMatchRequests() {
        if let user = userManager.currentUser {
            userManager.findMatchRequestByTutor(user: user)
        }
    }
    
    func addSubscribers() {
        userManager.$teachingMatchRequests
            .dropFirst()
            .map { matchRequests -> [MatchRequest] in
                if let matchRequests = matchRequests {
                    return matchRequests.requests
                } else {
                    return []
                }
            }
            .sink { [weak self] returnedMatchRequests in
                self?.matchRequests = returnedMatchRequests
                self?.isLoading = false
            }
            .store(in: &cancellables)
    }
    
    
}

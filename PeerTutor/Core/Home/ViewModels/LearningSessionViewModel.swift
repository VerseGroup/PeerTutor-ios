//
//  LearningSessionViewModel.swift
//  PeerTutor
//
//  Created by Steven Yu on 10/30/21.
//

import Foundation
import Combine

// bug where won't tell user is loading - fixed :)
class LearningSessionViewModel: ObservableObject {
    var userManager: UserManager = UserManager.instance
    
    @Published var matches: [Match] = []
    @Published var isLoading: Bool = true
    
    
    var cancellables = Set<AnyCancellable>()
    
    init() {
        getMatches()
        addSubscribers()
    }
    
    private func getMatches() {
        if let user = userManager.currentUser {
            userManager.findMatchByTutee(user: user)
        }
    }
    
    // binds to the currentUser to display info
    func addSubscribers() {
        userManager.$learningMatches
            // fixes issue with first element being empty
            .dropFirst()
            .map { matches -> [Match] in
                if let matches = matches {
                    return matches.matches
                } else {
                    return []
                }
            }
            .sink { [weak self] returnedMatches in
                self?.matches = returnedMatches
                print(returnedMatches)
                self?.isLoading = false
            }
            .store(in: &cancellables)
    }
    
}


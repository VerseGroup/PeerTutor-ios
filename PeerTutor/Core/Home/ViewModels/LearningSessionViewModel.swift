//
//  LearningSessionViewModel.swift
//  PeerTutor
//
//  Created by Steven Yu on 10/30/21.
//

import Foundation
import Combine

// bug where won't tell user is loading
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
            .map { matches -> (matches: [Match], loading: Bool) in
                if let matches = matches {
                    return (matches.matches, false)
                } else {
                    return ([], false)
                }
            }
            .sink { [weak self] returnedData in
                self?.matches = returnedData.matches
                print(returnedData)
                self?.isLoading = returnedData.loading
            }
            .store(in: &cancellables)
    }
    
}


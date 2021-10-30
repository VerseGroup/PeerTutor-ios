//
//  HomeViewModel.swift
//  PeerTutor
//
//  Created by Steven Yu on 10/17/21.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    var userManager: UserManager = UserManager.instance
    
    @Published var username: String = ""
    
    
    var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    // binds to the currentUser to display info
    func addSubscribers() {
        userManager.$currentUser
            .map { currentUser -> String in
                if let user = currentUser {
                    return user.username
                } else {
                    return ""
                }
            }
            .sink { [weak self] username in
                self?.username = username
            }
            .store(in: &cancellables)
    }
    
}

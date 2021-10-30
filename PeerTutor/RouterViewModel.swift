//
//  RouterViewModel.swift
//  PeerTutor
//
//  Created by Steven Yu on 10/27/21.
//

import Foundation
import Combine

// handles when to show the home view and authentication view, depends on UserManager
class RouterViewModel: ObservableObject {
    @Published var showHomeView = false
    var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    // subscribes to the signedIn boolean, if signedIn becomes false, will store that value in showHomeView, so will switch showing the views
    private func addSubscribers() {
        UserManager.instance.$signedIn
            .sink { [weak self] value in
                self?.showHomeView = value
            }
            .store(in: &cancellables)
    }
}

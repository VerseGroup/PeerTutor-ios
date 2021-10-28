//
//  ContentViewModel.swift
//  PeerTutor
//
//  Created by Steven Yu on 10/27/21.
//

import Foundation
import Combine

class RouterViewModel: ObservableObject {
    @Published var showHomeView = false
    var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    private func addSubscribers() {
        UserManager.instance.$signedIn
            .sink { [weak self] value in
                self?.showHomeView = value
            }
            .store(in: &cancellables)
    }
}

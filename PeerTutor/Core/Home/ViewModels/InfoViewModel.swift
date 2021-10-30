//
//  InfoViewModel.swift
//  PeerTutor
//
//  Created by Steven Yu on 10/30/21.
//

import Foundation
import Combine

class InfoViewModel: ObservableObject {
    var userManager: UserManager = UserManager.instance
    
    @Published var username: String = ""
    @Published var email: String = ""
    @Published var grade: String = ""
    @Published var comfortableGrades: String = ""
    @Published var frees: String = ""
    
    var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    // binds to the currentUser to display info
    func addSubscribers() {
        userManager.$currentUser
            .map { currentUser -> (username: String, email: String, grade: String, comfortableGrades: String, frees: String) in
                if let user = currentUser {
                    let username = user.username
                    let email = user.email
                    let grade = "\(user.grade)"
                    let comfortableGrades = user.teachableGrades.map{String.init($0)}.joined(separator: ", ")
                    let frees = user.frees.map{$0.description}.joined(separator: ",  ")
                    return (username, email, grade, comfortableGrades, frees)
                } else {
                    return ("", "", "", "", "")
                }
            }
            .sink { [weak self] userDetails in
                self?.username = userDetails.username
                self?.email = userDetails.email
                self?.grade = userDetails.grade
                self?.comfortableGrades = userDetails.comfortableGrades
                self?.frees = userDetails.frees
            }
            .store(in: &cancellables)
    }
    
    func logoutUser() {
        userManager.logoutUser()
    }
}

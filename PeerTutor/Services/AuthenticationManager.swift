//
//  AuthenticationManager.swift
//  PeerTutor
//
//  Created by Steven Yu on 10/25/21.
//

import Foundation
import SwiftUI
import Combine

class AuthenticationManager: ObservableObject {
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false
    private var cancellables = Set<AnyCancellable>()
    private var api = APIManager()
    
    // handles the completion, if fetches data successfully, sinks data, otherwise prints error
    func completionHandler(result: Subscribers.Completion<Error>) -> () {
        switch result {
        case .finished:
            print("Sucessfuly retrieved data!")
            break
        case .failure(let error):
            print("Error retrieving data: \(error)")
        }
    }
    
    // registers a user and sets the currentUser to the user, otherwise shows user an error message
    func registerUser(username: String, email: String, grade: Int, password: String, frees: [Period], teachableGrades: [Int]) {
        api.registerUser(username: username, email: email, grade: grade, password: password, frees: frees, teachableGrades: teachableGrades)
            .sink(receiveCompletion: completionHandler) { JSONMessage in
                if let user = JSONMessage.user {
                    print(user)
                } else {
                    
                }
            }
            .store(in: &cancellables)
    }
    
    // logs in a user and sets the currentUser to the user, otherwise shows user an error message
    func loginUser(username: String, password: String) {
        api.loginUser(username: username, password: password)
            .sink(receiveCompletion: completionHandler) { JSONMessage in
                if let user = JSONMessage.user {
                    let userManager = UserManager(user: user)
                } else {
                    print("Coudln't log in...")
                }
            }
            .store(in: &cancellables)
    }
}

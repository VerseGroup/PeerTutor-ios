//
//  AuthenticationViewModel.swift
//  PeerTutor
//
//  Created by Steven Yu on 10/19/21.
//

import Foundation
import SwiftUI
import Combine

class AuthenticationViewModel: ObservableObject {
    private let userManager = UserManager.instance
    private let api = APIManager()
    
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var email: String = ""
    @Published var alertMessage: String = ""
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    private func addSubscribers() {
        UserManager.instance.$alertMessage
            .sink { [weak self] message in
                self?.alertMessage = message
            }
            .store(in: &cancellables)
    }
    
    func login() {
        userManager.loginUser(username: username, password: password)
    }
    
    func register() {
//        userManager.registerUser(username: username, email: email, grade: <#T##Int#>, password: password, frees: <#T##[Period]#>, teachableGrades: <#T##[Int]#>)
    }
    
}

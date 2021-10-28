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
    @Published var gradePicker: Int = 0
    @Published var frees: [Period] = []
    @Published var teachableGrades: [Int] = []
    @Published var alertMessage: String = ""
    
    let grades: [Int] = [9, 10, 11, 12]
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    // subscribes to alertMessage, will automatically change the vm's message if UserManager's alertMessage changes
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
    
    // WIP
    func register() {
        userManager.registerUser(username: username, email: email, grade: grades[gradePicker], password: password, frees: frees, teachableGrades: teachableGrades)
    }
    
}

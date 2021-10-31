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
    @Published var alertMessage: String = "" {
        didSet {
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                self.alertMessage = ""
            }
        }
    }
    
    @Published var allPeriods: [Period] = Period.allCases
    
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
        if(username.isEmpty || password.isEmpty) {
            alertMessage = "Please fill out all info!"
        } else {
            userManager.loginUser(username: username, password: password)
        }
    }
    
    func selectPeriod(period: Period) {
        if frees.contains(period) {
            frees.removeAll(where: {$0 == period})
        } else {
            frees.append(period)
        }
    }
    
    func selectGrade(grade: Int) {
        if teachableGrades.contains(grade) {
            teachableGrades.removeAll(where: {$0 == grade})
        } else {
            teachableGrades.append(grade)
        }
    }
    
    // WIP
    func register() {
        print(username) // finished
        print(email) // finished
        print(grades[gradePicker]) // finished
        print(password) // finished
        print(frees) // finished
        print(teachableGrades) // finished
        if(frees.isEmpty) {
            alertMessage = "Select some frees!"
        } else if(teachableGrades.isEmpty) {
            alertMessage = "Select some grades you want to teach!"
        } else if(username.isEmpty || email.isEmpty || password.isEmpty) {
            alertMessage = "Please fill out all info!"
        } else {
            userManager.registerUser(username: username, email: email, grade: grades[gradePicker], password: password, frees: frees, teachableGrades: teachableGrades)
        }
    }
    
}

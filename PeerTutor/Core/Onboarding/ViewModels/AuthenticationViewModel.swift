//
//  AuthenticationViewModel.swift
//  PeerTutor
//
//  Created by Steven Yu on 10/19/21.
//

import Foundation
import SwiftUI

class AuthenticationViewModel: ObservableObject {
    private let api = APIManager()
    
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var email: String = ""
    
    @Published var showAlert: Bool = false
    @Published var alertMessage: String = ""
    
    func login() {
        
    }
    
    
}

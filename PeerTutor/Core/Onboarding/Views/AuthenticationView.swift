//
//  AuthenticationView.swift
//  PeerTutor
//
//  Created by Steven Yu on 10/25/21.
//

import SwiftUI

struct AuthenticationView: View {
    // shows welcome view only on first screen
    @AppStorage("show_welcome") var showWelcomeView: Bool = true
    
    var body: some View {
        VStack {
            Text("Hello, please sign in!")
                .fullScreenCover(isPresented: $showWelcomeView, content: {
                    WelcomeView(showWelcome: $showWelcomeView)
                })
        }
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
    }
}

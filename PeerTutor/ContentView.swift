//
//  ContentView.swift
//  PeerTutor
//
//  Created by Steven Yu on 10/17/21.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false
    
    var body: some View {
        if currentUserSignedIn {
            NavigationView {
                HomeView()
                    .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .top)))
                    .navigationBarHidden(true)
            }
        } else {
            AuthenticationView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

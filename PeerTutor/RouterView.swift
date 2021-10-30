//
//  RouterView.swift
//  PeerTutor
//
//  Created by Steven Yu on 10/17/21.
//

import SwiftUI

// handles routing the home view and the authentication view
struct RouterView: View {
    private var userManager = UserManager.instance
    @StateObject private var vm = RouterViewModel()
    
    var body: some View {
        ZStack {
            if vm.showHomeView {
                NavigationView {
                    HomeView()
                        .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .top)))
                        .navigationBarHidden(true)
                }
            }
            if !vm.showHomeView {
                AuthenticationView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RouterView()
    }
}

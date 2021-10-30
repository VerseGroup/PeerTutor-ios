//
//  HomeView.swift
//  PeerTutor
//
//  Created by Steven Yu on 10/17/21.
//

import SwiftUI


// TO DO:
/*
 - Authentication
  - Finish Register Page
 - Implement other Home Views
 */

struct HomeView: View {
    @StateObject private var vm = HomeViewModel()
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            homeHeader
            
            welcomeMessage
            
            // navigation
            VStack(spacing: 50) {
                sessionsSection
                requestsSection
                infoSection
            }
            .padding()
        }
        .ignoresSafeArea(.all, edges: .top)
    }
}

extension HomeView {
    // header
    private var homeHeader: some View {
        ZStack {
            Color.theme.secondaryBackground
            
            LogoView()
                .padding(.top, 30)
        }
        .frame(width: nil, height: 100)
    }
    
    // welcomes the currentUser
    private var welcomeMessage: some View {
        VStack(alignment: .leading) {
            Text("Welcome, \(vm.username)!")
                .font(.title)
                .fontWeight(.bold)
                .padding()
        }
    }
    
    // sessions
    private var sessionsSection: some View {
        VStack(alignment: .leading, spacing: 20) {
            Label(
                title: { Text("Sessions") },
                icon: { Image(systemName: "person.fill") }
            )
            
            // learning sessions
            NavigationLink(
                destination: LearningSessionView(),
                label: {
                    MenuTabView(color: Color.theme.blue, text: "Your learning\nsessions")
                })
            
            // teaching sessions
            NavigationLink(
                destination: TeachingSessionView(),
                label: {
                    MenuTabView(color: Color.theme.green, text: "Your teaching\nsessions")
                })
        }
    }
    
    // requests
    private var requestsSection: some View {
        VStack(alignment: .leading, spacing: 20) {
            Label(
                title: { Text("Requests") },
                icon: { Image(systemName: "person.fill.badge.plus") }
            )
            
            // learning requests
            NavigationLink(
                destination: Text("Learning Requests"),
                label: {
                    MenuTabView(color: Color.theme.red, text: "Your learning\nrequests")
                })
            
            // teaching requests
            NavigationLink(
                destination: Text("Teaching Requests"),
                label: {
                    MenuTabView(color: Color.theme.yellow, text: "Your teaching\nrequests")
                })
        }
    }
    
    private var infoSection: some View {
        VStack(alignment: .leading, spacing: 20) {
            Label(
                title: { Text("Info") },
                icon: { Image(systemName: "info.circle") }
            )
            
            // user info
            NavigationLink(
                destination: InfoView(),
                label: {
                    MenuTabView(color: Color.theme.orange, text: "Your user\ninfo")
                })
            
            // about this app
            NavigationLink(
                destination: AboutView(),
                label: {
                    MenuTabView(color: Color.theme.purple, text: "About this\napp")
                })
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
                    .preferredColorScheme(.light)
            }
            
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
                    .preferredColorScheme(.dark)
            }
        }
        
    }
}

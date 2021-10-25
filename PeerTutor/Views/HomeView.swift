//
//  HomeView.swift
//  PeerTutor
//
//  Created by Steven Yu on 10/17/21.
//

import SwiftUI

struct HomeView: View {
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
    private var homeHeader: some View {
        ZStack {
            Color.theme.secondaryBackground
            
            LogoView()
                .padding(.top, 30)
        }
        .frame(width: nil, height: 100)
    }
    
    private var welcomeMessage: some View {
        VStack(alignment: .leading) {
            Text("Welcome!")
                .font(.title)
                .fontWeight(.bold)
                .padding()
        }
    }
    
    private var sessionsSection: some View {
        VStack(alignment: .leading, spacing: 20) {
            Label(
                title: { Text("Sessions") },
                icon: { Image(systemName: "person.fill") }
            )
            
            NavigationLink(
                destination: Text("Learning Sessions"),
                label: {
                    TabView(color: Color.theme.blue, text: "Your learning\nsessions")
                })
            
            NavigationLink(
                destination: Text("Teaching Sessions"),
                label: {
                    TabView(color: Color.theme.green, text: "Your teaching\nsessions")
                })
        }
    }
    
    private var requestsSection: some View {
        VStack(alignment: .leading, spacing: 20) {
            Label(
                title: { Text("Requests") },
                icon: { Image(systemName: "person.fill.badge.plus") }
            )
            
            NavigationLink(
                destination: Text("Learning Requests"),
                label: {
                    TabView(color: Color.theme.red, text: "Your learning\nrequests")
                })
            
            NavigationLink(
                destination: Text("Teaching Requests"),
                label: {
                    TabView(color: Color.theme.yellow, text: "Your teaching\nrequests")
                })
        }
    }
    
    private var infoSection: some View {
        VStack(alignment: .leading, spacing: 20) {
            Label(
                title: { Text("Info") },
                icon: { Image(systemName: "info.circle") }
            )
            
            NavigationLink(
                destination: Text("Your user info"),
                label: {
                    TabView(color: Color.theme.orange, text: "Your user\ninfo")
                })
            
            NavigationLink(
                destination: Text("About"),
                label: {
                    TabView(color: Color.theme.purple, text: "About this\napp")
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

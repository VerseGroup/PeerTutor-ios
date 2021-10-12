//
//  HomeView.swift
//  PeerTutor
//
//  Created by Steven Yu on 10/11/21.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    
    @State private var showTeaching: Bool = false
    
    var body: some View {
        if !showTeaching {
            VStack {
                Text("Your upcoming learning sessions")
                List {
                    ForEach(vm.learnMatches) { match in
                        LearnRowView(match: match)
                    }
                }
                .listStyle(PlainListStyle())
            }
        } else {
            VStack {
                Text("Your upcoming teaching sessions")
                List {
                    ForEach(vm.teachMatches) { match in
                        TeachRowView(match: match)
                    }
                }
                .listStyle(PlainListStyle())
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                .navigationBarTitle("Peer Tutor")
        }
        .environmentObject(dev.homeVM)
    }
}

//
//  TeachingSessionView.swift
//  PeerTutor
//
//  Created by Steven Yu on 10/30/21.
//

import SwiftUI

struct TeachingSessionView: View {
    
    @StateObject private var vm = TeachingSessionViewModel()
    @State private var selectedMatch: Match? = nil
    @State private var showDetailView: Bool = false // detail sheet
    
    var body: some View {
        ZStack {
            // background
            Color.teachingSessionTheme.background
                .ignoresSafeArea()
            VStack(alignment: .leading, spacing: 25) {
                // content
//                if vm.isLoading {
//                    Text("Loading data...")
//                        .font(.largeTitle)
//                } else {
                    if vm.matches.count == 0 {
                        Text("No teaching sessions found, go and make some in Teaching Requests!")
                            .font(.largeTitle)
                    } else {
                        ScrollView {
                            VStack(spacing: 25) {
                                ForEach(vm.matches) { match in
                                    MatchTabView(match: match)
                                        // on tap, go to the detail view of the match
                                        .onTapGesture {
                                            segue(match: match)
                                        }
                                }
                            }
                            .padding(.top)
                        }
                    }
//                }
            }
            .padding()
            .background(
                NavigationLink(
                    destination: TeachingSessionLoadingView(match: $selectedMatch),
                    isActive: $showDetailView,
                    label: { EmptyView() }
                )
            )
        }
        .navigationBarTitle("Teaching Sessions")
    }
}

extension TeachingSessionView {
    private func segue(match: Match) {
        selectedMatch = match
        showDetailView.toggle()
    }
}

struct TeachingSessionView_Previews: PreviewProvider {
    static var previews: some View {
        TeachingSessionView()
    }
}

//
//  LearningSessionView.swift
//  PeerTutor
//
//  Created by Steven Yu on 10/30/21.
//

import SwiftUI

struct LearningSessionView: View {
    
    @StateObject private var vm = LearningSessionViewModel()
    @State private var selectedMatch: Match? = nil
    @State private var showDetailView: Bool = false // detail sheet
    
    var body: some View {
        ZStack {
            // background
            Color.learningSessionTheme.background
                .ignoresSafeArea()
            VStack(alignment: .leading, spacing: 25) {
                // content
//                if vm.isLoading {
//                    Text("Loading data...")
//                        .font(.largeTitle)
//                } else {
                    if vm.matches.count == 0 {
                        Text("No learning sessions found, go and make some in Learning Requests!")
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
                    destination: LearningSessionLoadingView(match: $selectedMatch),
                    isActive: $showDetailView,
                    label: { EmptyView() }
                )
            )
        }
        .navigationBarTitle("Learning Sessions")
    }
}

extension LearningSessionView {
    private func segue(match: Match) {
        selectedMatch = match
        showDetailView.toggle()
    }
}

struct LearningSessionView_Previews: PreviewProvider {
    static var previews: some View {
        LearningSessionView()
    }
}

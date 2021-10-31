//
//  LearningRequestView.swift
//  PeerTutor
//
//  Created by Steven Yu on 10/30/21.
//

import SwiftUI

struct LearningRequestView: View {
    
    @StateObject var vm = LearningRequestViewModel()
    @State private var selectedMatchRequest: MatchRequest? = nil
    @State private var showDetailView: Bool = false
    
    var body: some View {
        ZStack {
            // background
            Color.learningRequestTheme.background
                .ignoresSafeArea()
            // content
            VStack(alignment: .leading, spacing: 25) {
                // content
                if vm.isLoading {
                    Text("Loading data...")
                        .font(.largeTitle)
                } else {
                    ScrollView {
                        VStack(alignment: .leading) {
                            // see existing learning requests
                            Label(
                                title: { Text("Pending Requests") },
                                icon: { Image(systemName: "clock.arrow.circlepath") }
                            )
                            VStack(spacing: 25) {
                                ForEach(vm.matchRequests) { matchRequest in
                                    MatchRequestTabView(matchRequest: matchRequest)
                                        .onTapGesture {
                                            segue(matchRequest: matchRequest)
                                        }
                                }
                            }
                            
                            // make learning request
                            Label(
                                title: { Text("Make a Learning Request") },
                                icon: { Image(systemName: "plus.circle") }
                            )
                            Button(action: {
                                
                            }, label: {
                                RequestButtonView(relationship: false)
                            })
                        }
                    }
                }
            }
            .padding()
            .background(
                NavigationLink(
                    destination: LearningRequestLoadingView(matchRequest: $selectedMatchRequest),
                    isActive: $showDetailView,
                    label: { EmptyView() }
                )
            )
        }
        .navigationTitle("Learning requests")
    }
}

extension LearningRequestView {
    private func segue(matchRequest: MatchRequest) {
        selectedMatchRequest = matchRequest
        showDetailView.toggle()
    }
}

struct LearningRequestView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LearningRequestView()
        }
    }
}

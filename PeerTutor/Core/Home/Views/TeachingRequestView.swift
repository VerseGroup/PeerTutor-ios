//
//  TeachingRequestView.swift
//  PeerTutor
//
//  Created by Steven Yu on 10/30/21.
//

import SwiftUI

struct TeachingRequestView: View {
    
    @StateObject var vm = TeachingRequestViewModel()
    @State private var selectedMatchRequest: MatchRequest? = nil
    @State private var showDetailView: Bool = false
    @State private var showCreateView: Bool = false
    
    var body: some View {
        ZStack {
            // background
            Color.teachingRequestTheme.background
                .ignoresSafeArea()
            // content
            VStack(alignment: .leading, spacing: 25) {
                // content
//                if vm.isLoading {
//                    Text("Loading data...")
//                        .font(.largeTitle)
//                } else {
                    ScrollView {
                        VStack(alignment: .leading) {
                            // make teaching request
                            Label(
                                title: { Text("Make a Teaching Request") },
                                icon: { Image(systemName: "plus.circle") }
                            )
                            Button(action: {
                                showCreateView.toggle()
                            }, label: {
                                RequestButtonView(relationship: true)
                            })
                            
                            // see existing teaching requests
                            Label(
                                title: { Text("Pending Requests") },
                                icon: { Image(systemName: "clock.arrow.circlepath") }
                            )
                            VStack(spacing: 10) {
                                ForEach(vm.matchRequests) { matchRequest in
                                    MatchRequestTabView(matchRequest: matchRequest)
                                        .onTapGesture {
                                            segue(matchRequest: matchRequest)
                                        }
                                }
                            }
                        }
                    }
//                }
            }
            .padding()
            .onAppear(perform: {
                // refreshes every time view come backs again
                vm.getMatchRequests()
            })
            .background(
                Group {
                    NavigationLink(
                        destination: TeachingRequestLoadingView(matchRequest: $selectedMatchRequest),
                        isActive: $showDetailView,
                        label: { EmptyView() }
                    )
                    
                    NavigationLink(
                        destination: CreateTeachingRequestView(),
                        isActive: $showCreateView,
                        label: { EmptyView() }
                    )
                }
            )
        }
        .navigationTitle("Teaching requests")
    }
}

extension TeachingRequestView {
    private func segue(matchRequest: MatchRequest) {
        selectedMatchRequest = matchRequest
        showDetailView.toggle()
    }
}

struct TeachingRequestView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TeachingRequestView()
        }
    }
}

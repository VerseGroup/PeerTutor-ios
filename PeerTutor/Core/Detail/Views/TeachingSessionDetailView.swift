//
//  TeachingSessionDetailView.swift
//  PeerTutor
//
//  Created by Steven Yu on 10/30/21.
//

import SwiftUI

struct TeachingSessionLoadingView: View {
    
    @Binding var match: Match?
    
    var body: some View {
        ZStack {
            if let match = match {
                TeachingSessionDetailView(match: match)
            }
        }
    }
    
}

struct TeachingSessionDetailView: View {
    @StateObject private var vm: TeachingSessionDetailViewModel
    
    init(match: Match) {
        _vm = StateObject(wrappedValue: TeachingSessionDetailViewModel(match: match))
    }
    
    var body: some View {
        ZStack {
            // background
            Color.teachingSessionTheme.background
                .ignoresSafeArea()
            
            VStack {
                ScrollView {
                    VStack(spacing: 20) {
                        VStack(alignment: .leading) {
                            Label(
                                title: { Text("Course Info") },
                                icon: { Image(systemName: "text.book.closed.fill") }
                            )
                            CourseInfoView(match: vm.match, course: vm.course)
                        }
                        
                        VStack(alignment: .leading) {
                            Label(
                                title: { Text("Tutee Info") },
                                icon: { Image(systemName: "person.fill") }
                            )
                            UserInfoView(match: vm.match, user: vm.tutee)
                        }
                        
                        VStack(alignment: .leading) {
                            Label(
                                title: { Text("Schedule Info") },
                                icon: { Image(systemName: "calendar") }
                            )
                            ScheduleInfoView(match: vm.match, period: vm.period)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Teaching Session")
        }
    }
}

struct TeachingSessionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TeachingSessionDetailView(match: Match(id: 1, tutor: dev.user1, tutee: dev.user2, course: dev.course1, period: Period.d1p2))
        }
    }
}

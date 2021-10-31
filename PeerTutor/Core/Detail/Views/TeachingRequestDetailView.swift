//
//  TeachingRequestDetailView.swift
//  PeerTutor
//
//  Created by Steven Yu on 10/30/21.
//

import SwiftUI

struct TeachingRequestLoadingView: View {
    
    @Binding var matchRequest: MatchRequest?
    
    var body: some View {
        ZStack {
            if let matchRequest = matchRequest {
                TeachingRequestDetailView(matchRequest: matchRequest)
            }
        }
    }
}

struct TeachingRequestDetailView: View {
    @StateObject private var vm: TeachingRequestDetailViewModel
    
    init(matchRequest: MatchRequest) {
        _vm = StateObject(wrappedValue: TeachingRequestDetailViewModel(matchRequest: matchRequest))
    }
    
    var body: some View {
        ZStack {
            Color.teachingRequestTheme.background
                .ignoresSafeArea()
            
            VStack {
                ScrollView {
                    VStack(spacing: 20) {
                        VStack(alignment: .leading) {
                            Label(
                                title: { Text("Course Info") },
                                icon: { Image(systemName: "text.book.closed.fill") }
                            )
                            CourseInfoView(color: Color.teachingRequestTheme.foreground, course: vm.course)
                        }
                        
                        VStack(alignment: .leading) {
                            Label(
                                title: { Text("Tutee Info") },
                                icon: { Image(systemName: "person.fill") }
                            )
                            // placeholder thing
                            placeholderUserView
                        }
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Teaching Request")
    }
}

extension TeachingRequestDetailView {
    private var placeholderUserView: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text("Not fulfilled yet 😭")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text("Check back later!")
                    .font(.headline)
                    .foregroundColor(Color.theme.secondaryText)
            }
            .padding()
            .frame(maxWidth: UIScreen.main.bounds.width, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color.teachingRequestTheme.foreground)
                    .shadow(color: Color.theme.secondaryText.opacity(0.2), radius: 5, y: 5)
            )
        }
        .frame(height: 100)
        .foregroundColor(Color.theme.text)
        .font(.title)
    }
}


struct TeachingRequestDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TeachingRequestDetailView(matchRequest: dev.matchRequest1)
        }
    }
}

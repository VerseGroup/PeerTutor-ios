//
//  LearningRequestDetailView.swift
//  PeerTutor
//
//  Created by Steven Yu on 10/30/21.
//

import SwiftUI

struct LearningRequestLoadingView: View {
    
    @Binding var matchRequest: MatchRequest?
    
    var body: some View {
        ZStack {
            if let matchRequest = matchRequest {
                LearningRequestDetailView(matchRequest: matchRequest)
            }
        }
    }
}

struct LearningRequestDetailView: View {
    @StateObject private var vm: LearningRequestDetailViewModel
    
    init(matchRequest: MatchRequest) {
        _vm = StateObject(wrappedValue: LearningRequestDetailViewModel(matchRequest: matchRequest))
    }
    
    var body: some View {
        ZStack {
            Color.learningRequestTheme.background
                .ignoresSafeArea()
            
            VStack {
                ScrollView {
                    VStack(spacing: 20) {
                        VStack(alignment: .leading) {
                            Label(
                                title: { Text("Course Info") },
                                icon: { Image(systemName: "text.book.closed.fill") }
                            )
                            CourseInfoView(color: Color.learningRequestTheme.foreground, course: vm.course)
                        }
                        
                        VStack(alignment: .leading) {
                            Label(
                                title: { Text("Tutor Info") },
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
        .navigationTitle("Learning Request")
    }
}

extension LearningRequestDetailView {
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
                    // if the tutee is the currentUser (if currentUser is the learner), make color the learning session color
                    // force unwrapped currentUser, which is bad and not safe, but why not lol
                    .foregroundColor(Color.learningRequestTheme.foreground)
                    .shadow(color: Color.theme.secondaryText.opacity(0.2), radius: 5, y: 5)
            )
        }
        .frame(height: 100)
        .foregroundColor(Color.theme.text)
        .font(.title)
    }
}


struct LearningRequestDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LearningRequestDetailView(matchRequest: dev.matchRequest1)
        }
    }
}

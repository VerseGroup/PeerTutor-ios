//
//  LearningSessionView.swift
//  PeerTutor
//
//  Created by Steven Yu on 10/30/21.
//

import SwiftUI

struct LearningSessionView: View {
    
    @StateObject private var vm = LearningSessionViewModel()
    
    var body: some View {
        ZStack {
            // background
            Color.learningSessionTheme.background
                .ignoresSafeArea()
            VStack(alignment: .leading, spacing: 25) {
                // content
                ScrollView {
                    ForEach(vm.matches) { match in
                        MatchTabView(match: match)
                            .padding()
                    }
                }
            }
        }
        .navigationBarTitle("User Info")
    }
}

struct LearningSessionView_Previews: PreviewProvider {
    static var previews: some View {
        LearningSessionView()
    }
}

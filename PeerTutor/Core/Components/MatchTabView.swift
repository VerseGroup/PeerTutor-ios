//
//  MatchTabView.swift
//  PeerTutor
//
//  Created by Steven Yu on 10/30/21.
//

import SwiftUI

struct MatchTabView: View {
    
    var match: Match
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                HStack {
                    Text(match.course.name)
                        .fontWeight(.bold)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .font(Font.title.weight(.medium))
                }
                Text("with: ")
                    .font(.caption)
                    .foregroundColor(Color.theme.secondaryText)
                HStack(alignment: .bottom) {
                    // if currentUser is a tutee, show the tutor
                    Text(match.tutee.id == UserManager.instance.currentUser!.id ? match.tutor.username : match.tutee.username)
                        .font(.title3)
                        .fontWeight(.semibold)
                    Spacer()
                    Text(match.period.description)
                        .font(.title2)
                        .fontWeight(.semibold)
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    // if the tutee is the currentUser (if currentUser is the learner), make color the learning session color
                    // force unwrapped currentUser, which is bad and not safe, but why not lol
                    .foregroundColor(match.tutee.id == UserManager.instance.currentUser!.id ? Color.learningSessionTheme.foreground : Color.teachingSessionTheme.foreground)
                    .shadow(color: Color.theme.secondaryText.opacity(0.2), radius: 5, y: 5)
            )
        }
        .frame(height: 100)
        .foregroundColor(Color.theme.text)
        .font(.title)
    }
}

struct MatchTabView_Previews: PreviewProvider {
    static var previews: some View {
        MatchTabView(match: Match(id: 1, tutor: dev.user1, tutee: dev.user2, course: dev.course1, period: Period.d1p2))
    }
}

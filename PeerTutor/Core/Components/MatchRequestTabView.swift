//
//  MatchRequestTabView.swift
//  PeerTutor
//
//  Created by Steven Yu on 10/30/21.
//

import SwiftUI

struct MatchRequestTabView: View {
    
    var matchRequest: MatchRequest
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                HStack {
                    Text(matchRequest.course.name)
                        .fontWeight(.bold)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .font(Font.title.weight(.medium))
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    // if the tutee is the currentUser (if currentUser is the learner), make color the learning session color
                    // force unwrapped currentUser, which is bad and not safe, but why not lol
                    .foregroundColor(matchRequest.user.id == UserManager.instance.currentUser!.id ? Color.learningRequestTheme.foreground : Color.teachingRequestTheme.foreground)
                    .shadow(color: Color.theme.secondaryText.opacity(0.2), radius: 5, y: 5)
            )
        }
        .foregroundColor(Color.theme.text)
        .font(.title)
    }
}

struct MatchRequestTabView_Previews: PreviewProvider {
    static var previews: some View {
        MatchRequestTabView(matchRequest: dev.matchRequest1)
            .previewLayout(.sizeThatFits)
    }
}

//
//  UserInfoView.swift
//  PeerTutor
//
//  Created by Steven Yu on 10/30/21.
//

import SwiftUI

struct UserInfoView: View {
    
    var match: Match
    var user: User
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text(user.username)
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text(user.email)
                    .font(.headline)
                    .foregroundColor(Color.theme.secondaryText)
                
                Text("Grade \(user.grade)")
                    .font(.headline)
                    .foregroundColor(Color.theme.secondaryText)
            }
            .padding()
            .frame(maxWidth: UIScreen.main.bounds.width, alignment: .leading)
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

struct UserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoView(match: dev.match1, user: dev.user2)
    }
}

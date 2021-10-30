//
//  ScheduleInfoView.swift
//  PeerTutor
//
//  Created by Steven Yu on 10/30/21.
//

import SwiftUI

struct ScheduleInfoView: View {
    
    var match: Match
    var period: Period
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text("Every")
                    .font(.headline)
                    .foregroundColor(Color.theme.secondaryText)
                
                Text(period.description)
                    .font(.title2)
                    .fontWeight(.bold)
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

struct ScheduleInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleInfoView(match: dev.match1, period: Period.d1p2)
    }
}

//
//  LearnRowView.swift
//  PeerTutor
//
//  Created by Steven Yu on 10/11/21.
//

import SwiftUI

struct LearnRowView: View {
    
    var match: Match
    var isPending: Bool {
        return match.tutor == nil
    }

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Your tutor:")
                Text(match.tutor?.username ?? "")
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text(match.course.name)
                    .font(.headline)
                    .fontWeight(.semibold)
                Text(match.period.rawValue)
            }
        }
        .padding()
        .cornerRadius(10)
    }
}

struct LearnRowView_Previews: PreviewProvider {
    static var previews: some View {
        LearnRowView(match: dev.match1)
            .previewLayout(.sizeThatFits)
    }
}

//
//  LogoView.swift
//  PeerTutor
//
//  Created by Steven Yu on 10/17/21.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        Label(
            title: {
                Text("PeerTutor")
                    .fontWeight(.bold)
            },
            icon: {
                Image(systemName: "graduationcap.fill")
            }
        )
        .foregroundColor(Color.theme.text)
        .font(.largeTitle)
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
            .previewLayout(.sizeThatFits)
    }
}

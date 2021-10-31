//
//  RequestButtonView.swift
//  PeerTutor
//
//  Created by Steven Yu on 10/30/21.
//

import SwiftUI

struct RequestButtonView: View {
    
    // if relationship is true, that means it's teaching
    var relationship: Bool
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                HStack {
                    Text("Make a Request")
                        .fontWeight(.bold)
                    Spacer()
                    Image(systemName: "plus")
                        .font(Font.title.weight(.medium))
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(relationship ? Color.teachingRequestTheme.foreground : Color.learningRequestTheme.foreground)
                    .shadow(color: Color.theme.secondaryText.opacity(0.2), radius: 5, y: 5)
            )
        }
        .frame(height: 100)
        .foregroundColor(Color.theme.text)
        .font(.title)
    }
}

struct RequestButtonView_Previews: PreviewProvider {
    static var previews: some View {
        RequestButtonView(relationship: false)
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}

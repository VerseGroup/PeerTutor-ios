//
//  MenuTabView.swift
//  PeerTutor
//
//  Created by Steven Yu on 10/17/21.
//

import SwiftUI

struct MenuTabView: View {
    
    var color: Color
    var text: String
    
    var body: some View {
        ZStack {
            HStack {
                Text(text)
                    .fontWeight(.bold)
                Spacer()
                Image(systemName: "chevron.right")
                    .font(Font.title.weight(.medium))
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(color)
                    .shadow(color: Color.theme.secondaryText.opacity(0.2), radius: 5, y: 5)
            )
        }
        .frame(height: 100)
        .foregroundColor(Color.theme.text)
        .font(.title)
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        MenuTabView(color: Color.red, text: "Your learning\nsessions")
            .previewLayout(.sizeThatFits)
    }
}

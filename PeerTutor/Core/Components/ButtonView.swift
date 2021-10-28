//
//  ButtonView.swift
//  PeerTutor
//
//  Created by Steven Yu on 10/27/21.
//

import SwiftUI

struct ButtonView: View {
    
    var color: Color
    var text: String
    
    var body: some View {
        Text(text)
            .font(.headline)
            .foregroundColor(Color.theme.text)
            .background(
                RoundedRectangle(cornerRadius: 25.0)
                    .foregroundColor(color)
                    .frame(width: 150, height: 50)
            )
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(color: Color.theme.orange, text: "Sign Up")
    }
}

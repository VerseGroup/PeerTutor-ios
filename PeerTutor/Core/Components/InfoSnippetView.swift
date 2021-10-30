//
//  InfoSnippetView.swift
//  PeerTutor
//
//  Created by Steven Yu on 10/27/21.
//

import SwiftUI

struct InfoSnippetView: View {
    var caption: String
    var info: String?
    var frees: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(caption)
                .font(.headline)
                .foregroundColor(Color.theme.secondaryText)
            Text(info ?? "")
                .font(frees ? .headline : .title)
                .fontWeight(.bold)
                .foregroundColor(Color.theme.text)
        }
    }
}

struct InfoSnippetView_Previews: PreviewProvider {
    static var previews: some View {
        InfoSnippetView(caption: "Username:", info: "Barack Obama")
    }
}

//
//  GradeRowView.swift
//  PeerTutor
//
//  Created by Steven Yu on 10/31/21.
//

import SwiftUI

struct GradeRowView: View {
    
    var grade: Int
    var color: Color
    
    var body: some View {
        Text("\(grade)")
            .font(.caption)
            .fontWeight(.bold)
            .padding()
            .frame(width: 90, height: 35)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(color)
            )
    }
}

struct GradeRowView_Previews: PreviewProvider {
    static var previews: some View {
        GradeRowView(grade: 12, color: Color.theme.orange)
    }
}

//
//  PeriodRowView.swift
//  PeerTutor
//
//  Created by Steven Yu on 10/31/21.
//

import SwiftUI

struct PeriodRowView: View {
    
    var period: Period
    var color: Color
    
    var body: some View {
        Text(period.description)
            .font(.headline)
            .padding()
            .frame(width: 100, height: 75)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(color)
            )
    }
}

struct PeriodRowView_Previews: PreviewProvider {
    static var previews: some View {
        PeriodRowView(period: Period.d1p1, color: Color.theme.orange)
            .previewLayout(.sizeThatFits)
    }
}

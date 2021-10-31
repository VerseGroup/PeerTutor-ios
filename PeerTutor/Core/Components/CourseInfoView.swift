//
//  CourseInfoView.swift
//  PeerTutor
//
//  Created by Steven Yu on 10/30/21.
//

import SwiftUI

struct CourseInfoView: View {
    
    // needs to be foreground color of theme
    var color: Color
    var course: Course
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text(course.name)
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text(course.description)
                    .font(.headline)
                    .foregroundColor(Color.theme.secondaryText)
            }
            .padding()
            .frame(maxWidth: UIScreen.main.bounds.width, alignment: .leading)
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

struct CourseInfoView_Previews: PreviewProvider {
    static var previews: some View {
        CourseInfoView(color: Color.learningSessionTheme.foreground, course: dev.course1)
    }
}

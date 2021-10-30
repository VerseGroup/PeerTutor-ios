//
//  InfoView.swift
//  PeerTutor
//
//  Created by Steven Yu on 10/27/21.
//

import SwiftUI

struct InfoView: View {
    @ObservedObject private var vm = InfoViewModel()
    
    var body: some View {
        ZStack {
            // background
            Color.infoTheme.background
                .ignoresSafeArea()
            VStack(alignment: .leading, spacing: 25) {
                // content
                VStack {
                    VStack(alignment: .leading) {
                        InfoSnippetView(caption: "Username:", info: vm.username)
                        
                        InfoSnippetView(caption: "Email:", info: vm.email)
                        
                        InfoSnippetView(caption: "Grade:", info: vm.grade)
                        
                        InfoSnippetView(caption: "Comfortable Grade Levels:", info: vm.comfortableGrades)
                        
                        InfoSnippetView(caption: "Free Periods:", info: vm.frees, frees: true)
                    }
                    
                    Spacer()
                    Button(action: {
                        vm.logoutUser()
                    }, label: {
                        ButtonView(color: Color.infoTheme.background, text: "Sign Out")
                    })
                    .padding()
                }
            }
            .padding()
            .frame(width: 300)
            .background(
                RoundedRectangle(cornerRadius: 25.0)
                    .foregroundColor(Color.infoTheme.foreground)
            )
        }
        .navigationBarTitle("User Info")
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}

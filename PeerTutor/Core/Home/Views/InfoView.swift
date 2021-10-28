//
//  InfoView.swift
//  PeerTutor
//
//  Created by Steven Yu on 10/27/21.
//

import SwiftUI

struct InfoView: View {
    @ObservedObject private var vm = HomeViewModel()
    
    var body: some View {
        ZStack {
            // background
            Color.infoTheme.background
                .ignoresSafeArea()
            VStack(alignment: .leading, spacing: 25) {
                // content
                VStack {
                    VStack(alignment: .leading) {
                        InfoSnippetView(caption: "Username:", info: vm.userManager.currentUser?.username)
                        
                        InfoSnippetView(caption: "Email:", info: vm.userManager.currentUser?.email)
                        
                        InfoSnippetView(caption: "Grade:", info: "\(vm.userManager.currentUser?.grade ?? 0)")
                        
                        InfoSnippetView(caption: "Comfortable Grade Levels:", info: vm.userManager.currentUser?.teachableGrades.map{String.init($0)}.joined(separator: ", "))
                        
                        InfoSnippetView(caption: "Free Periods:", info: vm.userManager.currentUser?.frees.map{$0.rawValue}.joined(separator: ", "))
                    }
                    
                    Spacer()
                    Button(action: {
                        vm.userManager.logoutUser()
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
